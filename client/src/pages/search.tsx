import { useQuery } from "@tanstack/react-query";
import { useSearch, Link } from "wouter";
import { Card } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Skeleton } from "@/components/ui/skeleton";
import { type Stotram, type Category } from "@shared/schema";
import { ArrowLeft, FileText, Globe, Search as SearchIcon } from "lucide-react";
import { SiYoutube } from "react-icons/si";

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

interface SearchResult {
  stotram: Stotram;
  category: Category;
}

export default function SearchPage() {
  const search = useSearch();
  const params = new URLSearchParams(search);
  const query = params.get("q") || "";

  const { data: results, isLoading } = useQuery<SearchResult[]>({
    queryKey: ["/api/search", query],
    queryFn: async () => {
      const res = await fetch(`/api/search?q=${encodeURIComponent(query)}`);
      if (!res.ok) throw new Error("Search failed");
      return res.json();
    },
    enabled: query.length > 0,
  });

  return (
    <div className="mx-auto max-w-4xl px-4 py-6">
      <Link href="/kavya-lahari" data-testid="link-back-home-search">
        <Button variant="ghost" className="gap-2 mb-4 -ml-2">
          <ArrowLeft className="h-4 w-4" />
          All Categories
        </Button>
      </Link>

      <div className="flex items-center gap-3 mb-6">
        <SearchIcon className="h-6 w-6 text-muted-foreground" />
        <div>
          <h1 className="text-2xl font-bold font-serif" data-testid="text-search-title">
            Search Results
          </h1>
          <p className="text-sm text-muted-foreground" data-testid="text-search-query">
            {query ? `Showing results for "${query}"` : "Enter a search term"}
          </p>
        </div>
      </div>

      {isLoading ? (
        <div className="space-y-3">
          {Array.from({ length: 4 }).map((_, i) => (
            <Card key={i} className="p-4">
              <div className="flex flex-col gap-2">
                <Skeleton className="h-5 w-48" />
                <Skeleton className="h-4 w-32" />
                <div className="flex gap-2">
                  <Skeleton className="h-5 w-16" />
                  <Skeleton className="h-5 w-16" />
                </div>
              </div>
            </Card>
          ))}
        </div>
      ) : results && results.length > 0 ? (
        <>
          <p className="text-xs text-muted-foreground mb-4" data-testid="text-result-count">
            {results.length} result{results.length !== 1 ? "s" : ""} found
          </p>
          <div className="space-y-2">
            {results.map(({ stotram, category }) => {
              const languages = ["telugu", "english", "kannada", "sanskrit"];
              const availableLanguages = languages.filter((l) => hasPdf(stotram, l));

              return (
                <Card
                  key={stotram.id}
                  className="hover-elevate p-4"
                  data-testid={`card-search-result-${stotram.id}`}
                >
                  <div className="flex flex-col gap-3">
                    <div className="flex items-start justify-between gap-3 flex-wrap">
                      <div className="min-w-0 flex-1">
                        <h3 className="font-medium text-sm sm:text-base leading-snug">
                          {stotram.name}
                        </h3>
                        <Link href={`/kavya-lahari/${category.slug}`}>
                          <Badge variant="secondary" className="mt-1 cursor-pointer text-[10px]">
                            {category.name}
                          </Badge>
                        </Link>
                      </div>
                      {stotram.videoUrl && (
                        <a href={stotram.videoUrl} target="_blank" rel="noopener noreferrer">
                          <Button size="sm" variant="outline" className="gap-1.5 shrink-0">
                            <SiYoutube className="h-3.5 w-3.5 text-red-500" />
                            <span className="hidden sm:inline text-xs">Watch</span>
                          </Button>
                        </a>
                      )}
                    </div>
                    {availableLanguages.length > 0 && (
                      <div className="flex items-center gap-2 flex-wrap">
                        <Globe className="h-3.5 w-3.5 text-muted-foreground shrink-0" />
                        {availableLanguages.map((lang) => {
                          const pdfUrl = getPdfUrl(stotram, lang);
                          return (
                            <a
                              key={lang}
                              href={pdfUrl || "#"}
                              target="_blank"
                              rel="noopener noreferrer"
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
              );
            })}
          </div>
        </>
      ) : query ? (
        <div className="text-center py-16">
          <SearchIcon className="h-12 w-12 text-muted-foreground mx-auto mb-4 opacity-40" />
          <p className="text-muted-foreground">
            No stotrams found for "{query}"
          </p>
          <p className="text-sm text-muted-foreground mt-1">
            Try searching with a different term
          </p>
        </div>
      ) : null}
    </div>
  );
}
