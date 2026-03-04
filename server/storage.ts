import { type Category, type Stotram, type InsertCategory, type InsertStotram } from "@shared/schema";
import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

export interface IStorage {
  getCategories(): Promise<Category[]>;
  getCategoryBySlug(slug: string): Promise<Category | undefined>;
  getStotramsByCategory(categoryId: number): Promise<Stotram[]>;
  searchStotrams(query: string): Promise<{ stotram: Stotram; category: Category }[]>;
  insertCategory(cat: InsertCategory): Promise<Category>;
  insertStotram(stot: InsertStotram): Promise<Stotram>;
  getCategoryCount(): Promise<number>;
  updateCategorySortOrder(slug: string, sortOrder: number): Promise<void>;
}

export class DatabaseStorage implements IStorage {
  private db: any;
  private categories: any;
  private stotrams: any;
  private eq: any;
  private ilike: any;
  private or: any;

  constructor(db: any, schema: any, operators: any) {
    this.db = db;
    this.categories = schema.categories;
    this.stotrams = schema.stotrams;
    this.eq = operators.eq;
    this.ilike = operators.ilike;
    this.or = operators.or;
  }

  async getCategories(): Promise<Category[]> {
    return this.db.select().from(this.categories).orderBy(this.categories.sortOrder);
  }

  async getCategoryBySlug(slug: string): Promise<Category | undefined> {
    const [cat] = await this.db.select().from(this.categories).where(this.eq(this.categories.slug, slug));
    return cat;
  }

  async getStotramsByCategory(categoryId: number): Promise<Stotram[]> {
    return this.db.select().from(this.stotrams).where(this.eq(this.stotrams.categoryId, categoryId)).orderBy(this.stotrams.sortOrder);
  }

  async searchStotrams(query: string): Promise<{ stotram: Stotram; category: Category }[]> {
    const pattern = `%${query}%`;
    const allStotrams = await this.db
      .select()
      .from(this.stotrams)
      .where(
        this.or(
          this.ilike(this.stotrams.name, pattern),
          this.ilike(this.stotrams.subcategory, pattern)
        )
      )
      .orderBy(this.stotrams.name);

    const results: { stotram: Stotram; category: Category }[] = [];
    const categoryCache = new Map<number, Category>();

    for (const stotram of allStotrams) {
      let category = categoryCache.get(stotram.categoryId);
      if (!category) {
        const [cat] = await this.db.select().from(this.categories).where(this.eq(this.categories.id, stotram.categoryId));
        if (cat) {
          categoryCache.set(cat.id, cat);
          category = cat;
        }
      }
      if (category) {
        results.push({ stotram, category });
      }
    }

    return results;
  }

  async insertCategory(cat: InsertCategory): Promise<Category> {
    const [inserted] = await this.db.insert(this.categories).values(cat).returning();
    return inserted;
  }

  async insertStotram(stot: InsertStotram): Promise<Stotram> {
    const [inserted] = await this.db.insert(this.stotrams).values(stot).returning();
    return inserted;
  }

  async getCategoryCount(): Promise<number> {
    const result = await this.db.select().from(this.categories);
    return result.length;
  }

  async updateCategorySortOrder(slug: string, sortOrder: number): Promise<void> {
    await this.db.update(this.categories).set({ sortOrder }).where(this.eq(this.categories.slug, slug));
  }
}

export class FileStorage implements IStorage {
  private categoriesList: Category[] = [];
  private stotramsBySlug: Record<string, Stotram[]> = {};

  constructor() {
    // const __filename = fileURLToPath(import.meta.url);
    // const __dirname = path.dirname(__filename);
    //const dataPath = path.join(__dirname, "data.json");
    const dataPath = path.resolve(process.cwd(), "server", "data.json");
    // const data = JSON.parse(fs.readFileSync(dataPath, "utf-8"));
    // this.categoriesList = data.categories;
    // this.stotramsBySlug = data.stotrams;
     const data = JSON.parse(fs.readFileSync(dataPath, "utf-8"));
     this.categoriesList = data.categories;
     this.stotramsBySlug = data.stotrams;
  }

  async getCategories(): Promise<Category[]> {
    return [...this.categoriesList].sort((a, b) => a.sortOrder - b.sortOrder);
  }

  async getCategoryBySlug(slug: string): Promise<Category | undefined> {
    return this.categoriesList.find((c) => c.slug === slug);
  }

  async getStotramsByCategory(categoryId: number): Promise<Stotram[]> {
    const cat = this.categoriesList.find((c) => c.id === categoryId);
    if (!cat) return [];
    const stotrams = this.stotramsBySlug[cat.slug] || [];
    return [...stotrams].sort((a, b) => a.sortOrder - b.sortOrder);
  }

  async searchStotrams(query: string): Promise<{ stotram: Stotram; category: Category }[]> {
    const lower = query.toLowerCase();
    const results: { stotram: Stotram; category: Category }[] = [];

    for (const cat of this.categoriesList) {
      const stotrams = this.stotramsBySlug[cat.slug] || [];
      for (const stotram of stotrams) {
        if (
          stotram.name.toLowerCase().includes(lower) ||
          (stotram.subcategory && stotram.subcategory.toLowerCase().includes(lower))
        ) {
          results.push({ stotram, category: cat });
        }
      }
    }

    return results.sort((a, b) => a.stotram.name.localeCompare(b.stotram.name));
  }

  async insertCategory(_cat: InsertCategory): Promise<Category> {
    throw new Error("File storage is read-only");
  }

  async insertStotram(_stot: InsertStotram): Promise<Stotram> {
    throw new Error("File storage is read-only");
  }

  async getCategoryCount(): Promise<number> {
    return this.categoriesList.length;
  }

  async updateCategorySortOrder(_slug: string, _sortOrder: number): Promise<void> {
  }
}

let storageInstance: IStorage | null = null;

async function createStorage(): Promise<IStorage> {
  if (process.env.DATABASE_URL) {
    try {
      const { db } = await import("./db");
      const schema = await import("@shared/schema");
      const { eq, ilike, or } = await import("drizzle-orm");
      const dbStorage = new DatabaseStorage(db, schema, { eq, ilike, or });
      await dbStorage.getCategoryCount();
      return dbStorage;
    } catch (e) {
      console.log("Database not available, using file-based storage:", (e as Error).message);
      return new FileStorage();
    }
  }
  console.log("No DATABASE_URL found, using file-based storage");
  return new FileStorage();
}

export async function getStorage(): Promise<IStorage> {
  if (!storageInstance) {
    storageInstance = await createStorage();
  }
  return storageInstance;
}

export const storage = new Proxy({} as IStorage, {
  get(_target, prop) {
    return async (...args: any[]) => {
      const s = await getStorage();
      return (s as any)[prop](...args);
    };
  },
});
