import { sql } from "drizzle-orm";
import { pgTable, text, varchar, integer, serial } from "drizzle-orm/pg-core";
import { createInsertSchema } from "drizzle-zod";
import { z } from "zod";

export const categories = pgTable("categories", {
  id: serial("id").primaryKey(),
  name: text("name").notNull(),
  slug: text("slug").notNull().unique(),
  description: text("description").notNull(),
  imageUrl: text("image_url").notNull(),
  sortOrder: integer("sort_order").notNull().default(0),
});

export const stotrams = pgTable("stotrams", {
  id: serial("id").primaryKey(),
  categoryId: integer("category_id").notNull(),
  name: text("name").notNull(),
  subcategory: text("subcategory"),
  videoUrl: text("video_url"),
  teluguPdfUrl: text("telugu_pdf_url"),
  englishPdfUrl: text("english_pdf_url"),
  kannadaPdfUrl: text("kannada_pdf_url"),
  sanskritPdfUrl: text("sanskrit_pdf_url"),
  sortOrder: integer("sort_order").notNull().default(0),
});

export const insertCategorySchema = createInsertSchema(categories).omit({ id: true });
export const insertStotramSchema = createInsertSchema(stotrams).omit({ id: true });

export type InsertCategory = z.infer<typeof insertCategorySchema>;
export type Category = typeof categories.$inferSelect;
export type InsertStotram = z.infer<typeof insertStotramSchema>;
export type Stotram = typeof stotrams.$inferSelect;
