import type { Express } from "express";
import { createServer, type Server } from "http";
import { storage } from "./storage";

const ALLOWED_PDF_HOST = "vedam-nadam.org";

export async function registerRoutes(
  httpServer: Server,
  app: Express
): Promise<Server> {
  app.get("/api/categories", async (_req, res) => {
    const cats = await storage.getCategories();
    res.json(cats);
  });

  app.get("/api/categories/:slug", async (req, res) => {
    const cat = await storage.getCategoryBySlug(req.params.slug);
    if (!cat) {
      return res.status(404).json({ message: "Category not found" });
    }
    res.json(cat);
  });

  app.get("/api/categories/:slug/stotrams", async (req, res) => {
    const cat = await storage.getCategoryBySlug(req.params.slug);
    if (!cat) {
      return res.status(404).json({ message: "Category not found" });
    }
    const stots = await storage.getStotramsByCategory(cat.id);
    res.json(stots);
  });

  app.get("/api/search", async (req, res) => {
    const q = (req.query.q as string) || "";
    if (!q.trim()) {
      return res.json([]);
    }
    const results = await storage.searchStotrams(q.trim());
    res.json(results);
  });

  app.get("/api/pdf", async (req, res) => {
    const url = req.query.url as string;
    if (!url) {
      return res.status(400).json({ message: "Missing url parameter" });
    }

    try {
      const parsed = new URL(url);
      if (parsed.hostname !== ALLOWED_PDF_HOST) {
        return res.status(403).json({ message: "URL not allowed" });
      }
      if (!parsed.pathname.endsWith(".pdf")) {
        return res.status(400).json({ message: "Not a PDF URL" });
      }

      const response = await fetch(url);
      if (!response.ok) {
        return res.status(response.status).json({ message: "Failed to fetch PDF" });
      }

      const filename = parsed.pathname.split("/").pop() || "document.pdf";
      res.setHeader("Content-Type", "application/pdf");
      res.setHeader("Content-Disposition", `inline; filename="${filename}"`);

      const buffer = await response.arrayBuffer();
      res.send(Buffer.from(buffer));
    } catch {
      return res.status(500).json({ message: "Error fetching PDF" });
    }
  });

  return httpServer;
}
