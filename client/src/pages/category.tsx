import { useQuery } from "@tanstack/react-query";
import { useParams, Link } from "wouter";
import { Card } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Skeleton } from "@/components/ui/skeleton";
import { type Category, type Stotram } from "@shared/schema";
import { ArrowLeft, FileText, Globe, BookOpen, ArrowRight } from "lucide-react";
import { SiYoutube } from "react-icons/si";
import { useState } from "react";
import { motion } from "framer-motion";

const languageLabels: Record<string, string> = {
  telugu: "Telugu",
  english: "English",
  kannada: "Kannada",
  sanskrit: "Devanagri",
};

const languageColors: Record<string, string> = {
  telugu: "bg-blue-500/10 text-blue-700 dark:text-blue-300",
  english: "bg-green-500/10 text-green-700 dark:text-green-300",
  kannada: "bg-purple-500/10 text-purple-700 dark:text-purple-300",
  sanskrit: "bg-amber-500/10 text-amber-700 dark:text-amber-300",
};

function getRawPdfUrl(stotram: Stotram, lang: string): string | null {
  switch (lang) {
    case "telugu": return stotram.teluguPdfUrl;
    case "english": return stotram.englishPdfUrl;
    case "kannada": return stotram.kannadaPdfUrl;
    case "sanskrit": return stotram.sanskritPdfUrl;
    default: return null;
  }
}

function getPdfUrl(stotram: Stotram, lang: string): string | null {
  const raw = getRawPdfUrl(stotram, lang);
  if (!raw) return null;
  return `/api/pdf?url=${encodeURIComponent(raw)}`;
}

function hasPdf(stotram: Stotram, lang: string): boolean {
  switch (lang) {
    case "telugu": return !!stotram.teluguPdfUrl;
    case "english": return !!stotram.englishPdfUrl;
    case "kannada": return !!stotram.kannadaPdfUrl;
    case "sanskrit": return !!stotram.sanskritPdfUrl;
    default: return false;
  }
}

function StotramRow({ stotram, index }: { stotram: Stotram; index: number }) {
  const languages = ["telugu", "english", "kannada", "sanskrit"];
  const availableLanguages = languages.filter((l) => hasPdf(stotram, l));

  return (
    <motion.div
      initial={{ opacity: 0, y: 12 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ delay: index * 0.03, duration: 0.3 }}
    >
      <Card
        className="hover-elevate p-4"
        data-testid={`card-stotram-${stotram.id}`}
      >
        <div className="flex flex-col gap-3">
          <div className="flex items-start justify-between gap-3 flex-wrap">
            <div className="flex items-center gap-3 min-w-0 flex-1">
              <span className="text-xs font-medium text-muted-foreground tabular-nums shrink-0 w-6 text-right">
                {index + 1}
              </span>
              <div className="min-w-0">
                <h3 className="font-medium text-sm sm:text-base leading-snug" data-testid={`text-stotram-name-${stotram.id}`}>
                  {stotram.name}
                </h3>
                {stotram.subcategory && (
                  <Badge variant="secondary" className="mt-1 text-[10px]" data-testid={`badge-subcategory-${stotram.id}`}>
                    {stotram.subcategory}
                  </Badge>
                )}
              </div>
            </div>

            {stotram.videoUrl && (
              <a
                href={stotram.videoUrl}
                target="_blank"
                rel="noopener noreferrer"
                data-testid={`link-video-${stotram.id}`}
              >
                <Button size="sm" variant="outline" className="gap-1.5 shrink-0">
                  <SiYoutube className="h-3.5 w-3.5 text-red-500" />
                  <span className="hidden sm:inline text-xs">Watch</span>
                </Button>
              </a>
            )}
          </div>

          {availableLanguages.length > 0 && (
            <div className="flex items-center gap-2 flex-wrap pl-9">
              <Globe className="h-3.5 w-3.5 text-muted-foreground shrink-0" />
              {availableLanguages.map((lang) => {
                const pdfUrl = getPdfUrl(stotram, lang);
                return (
                  <a
                    key={lang}
                    href={pdfUrl || "#"}
                    target="_blank"
                    rel="noopener noreferrer"
                    data-testid={`link-pdf-${lang}-${stotram.id}`}
                  >
                    <Badge
                      variant="outline"
                      className={`cursor-pointer text-[11px] gap-1 ${languageColors[lang]}`}
                    >
                      <FileText className="h-3 w-3" />
                      {languageLabels[lang]}
                    </Badge>
                  </a>
                );
              })}
            </div>
          )}
        </div>
      </Card>
    </motion.div>
  );
}

function StotramSkeleton() {
  return (
    <Card className="p-4">
      <div className="flex flex-col gap-3">
        <div className="flex items-center gap-3">
          <Skeleton className="h-4 w-6" />
          <Skeleton className="h-5 w-48" />
        </div>
        <div className="flex gap-2 pl-9">
          <Skeleton className="h-5 w-16" />
          <Skeleton className="h-5 w-16" />
          <Skeleton className="h-5 w-16" />
        </div>
      </div>
    </Card>
  );
}

export default function CategoryPage() {
  const { slug } = useParams<{ slug: string }>();
  const [filterLang, setFilterLang] = useState<string | null>(null);

  const { data: category, isLoading: catLoading } = useQuery<Category>({
    queryKey: ["/api/categories", slug],
  });

  const { data: stotrams, isLoading: stotLoading } = useQuery<Stotram[]>({
    queryKey: ["/api/categories", slug, "stotrams"],
  });

  const isLoading = catLoading || stotLoading;

  const isVishnu = slug === "vishnu";

  const narayaneeyamStotrams = isVishnu
    ? stotrams?.filter((s) => s.subcategory === "Narayaneeyam") || []
    : [];

  const mainStotrams = isVishnu
    ? stotrams?.filter((s) => s.subcategory !== "Narayaneeyam")
    : stotrams;

  const filteredStotrams = mainStotrams?.filter((s) => {
    if (!filterLang) return true;
    return hasPdf(s, filterLang);
  });

  const subcategories = [...new Set(mainStotrams?.map((s) => s.subcategory).filter(Boolean) || [])];
  const hasSubcategories = subcategories.length > 1;

  const groupedStotrams = hasSubcategories
    ? subcategories.reduce<Record<string, Stotram[]>>((acc, sub) => {
        acc[sub!] = (filteredStotrams || []).filter((s) => s.subcategory === sub);
        return acc;
      }, {})
    : null;

  const ungroupedStotrams = hasSubcategories
    ? (filteredStotrams || []).filter((s) => !s.subcategory)
    : filteredStotrams || [];

  return (
    <div className="mx-auto max-w-4xl px-4 py-6">
      <Link href="/kavya-lahari" data-testid="link-back-home">
        <Button variant="ghost" className="gap-2 mb-4 -ml-2">
          <ArrowLeft className="h-4 w-4" />
          All Categories
        </Button>
      </Link>

      {isLoading ? (
        <div className="space-y-4">
          <div className="flex items-center gap-4 mb-6">
            <Skeleton className="h-16 w-16 rounded-md" />
            <div className="space-y-2">
              <Skeleton className="h-7 w-48" />
              <Skeleton className="h-4 w-72" />
            </div>
          </div>
          {Array.from({ length: 5 }).map((_, i) => (
            <StotramSkeleton key={i} />
          ))}
        </div>
      ) : category ? (
        <>
          <div className="flex items-center gap-4 mb-6">
            <img
              src={category.imageUrl}
              alt={category.name}
              className="h-16 w-16 rounded-md object-cover"
              data-testid="img-category"
            />
            <div>
              <h1 className="text-2xl sm:text-3xl font-bold font-serif" data-testid="text-category-name">
                {category.name}
              </h1>
              <p className="text-sm text-muted-foreground mt-1">
                {category.description}
              </p>
            </div>
          </div>

          {isVishnu && narayaneeyamStotrams.length > 0 && (
            <Link href="/kavya-lahari/vishnu/narayaneeyam" data-testid="link-narayaneeyam">
              <Card className="mb-6 hover-elevate active-elevate-2 cursor-pointer overflow-visible">
                <div className="p-4 flex items-center gap-4">
                  <div className="flex items-center justify-center h-12 w-12 rounded-md bg-primary/10 shrink-0">
                    <BookOpen className="h-6 w-6 text-primary" />
                  </div>
                  <div className="flex-1 min-w-0">
                    <h3 className="font-semibold font-serif text-base">Narayaneeyam</h3>
                    <p className="text-xs text-muted-foreground mt-0.5">
                      {narayaneeyamStotrams.length} Dasakams by Melpathur Narayana Bhattathiri
                    </p>
                  </div>
                  <ArrowRight className="h-5 w-5 text-muted-foreground shrink-0" />
                </div>
              </Card>
            </Link>
          )}

          <div className="flex items-center gap-2 mb-4 flex-wrap">
            <span className="text-xs text-muted-foreground mr-1">Filter by language:</span>
            <Badge
              variant={filterLang === null ? "default" : "outline"}
              className="cursor-pointer text-xs"
              onClick={() => setFilterLang(null)}
              data-testid="filter-all"
            >
              All
            </Badge>
            {["telugu", "english", "kannada", "sanskrit"].map((lang) => (
              <Badge
                key={lang}
                variant={filterLang === lang ? "default" : "outline"}
                className={`cursor-pointer text-xs ${filterLang !== lang ? languageColors[lang] : ""}`}
                onClick={() => setFilterLang(filterLang === lang ? null : lang)}
                data-testid={`filter-${lang}`}
              >
                {languageLabels[lang]}
              </Badge>
            ))}
          </div>

          <div className="text-xs text-muted-foreground mb-4" data-testid="text-stotram-count">
            {filteredStotrams?.length || 0} stotram{(filteredStotrams?.length || 0) !== 1 ? "s" : ""} found
          </div>

          {hasSubcategories && groupedStotrams ? (
            <div className="space-y-6">
              {ungroupedStotrams.length > 0 && (
                <div className="space-y-2">
                  {ungroupedStotrams.map((stotram, i) => (
                    <StotramRow key={stotram.id} stotram={stotram} index={i} />
                  ))}
                </div>
              )}
              {Object.entries(groupedStotrams).map(([sub, items]) =>
                items.length > 0 ? (
                  <div key={sub}>
                    <h2 className="text-lg font-semibold font-serif mb-3 pl-1" data-testid={`text-subcategory-${sub}`}>
                      {sub}
                    </h2>
                    <div className="space-y-2">
                      {items.map((stotram, i) => (
                        <StotramRow key={stotram.id} stotram={stotram} index={i} />
                      ))}
                    </div>
                  </div>
                ) : null,
              )}
            </div>
          ) : (
            <div className="space-y-2">
              {ungroupedStotrams.map((stotram, i) => (
                <StotramRow key={stotram.id} stotram={stotram} index={i} />
              ))}
            </div>
          )}

          {filteredStotrams?.length === 0 && (
            <div className="text-center py-12">
              <p className="text-muted-foreground">
                No stotrams available for the selected language filter.
              </p>
            </div>
          )}
        </>
      ) : (
        <div className="text-center py-12">
          <p className="text-muted-foreground">Category not found.</p>
        </div>
      )}
    </div>
  );
}
