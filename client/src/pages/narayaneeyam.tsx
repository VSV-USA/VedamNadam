import { useQuery } from "@tanstack/react-query";
import { Link } from "wouter";
import { Card } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Skeleton } from "@/components/ui/skeleton";
import { type Category, type Stotram } from "@shared/schema";
import { ArrowLeft, FileText, Globe } from "lucide-react";
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

function DasakamRow({ stotram, index }: { stotram: Stotram; index: number }) {
  const languages = ["telugu", "english", "kannada", "sanskrit"];
  const availableLanguages = languages.filter((l) => hasPdf(stotram, l));

  return (
    <motion.div
      initial={{ opacity: 0, y: 12 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ delay: index * 0.02, duration: 0.3 }}
    >
      <Card
        className="hover-elevate p-4"
        data-testid={`card-dasakam-${stotram.id}`}
      >
        <div className="flex flex-col gap-3">
          <div className="flex items-start justify-between gap-3 flex-wrap">
            <div className="flex items-center gap-3 min-w-0 flex-1">
              <span className="text-xs font-medium text-muted-foreground tabular-nums shrink-0 w-6 text-right">
                {index}
              </span>
              <h3 className="font-medium text-sm sm:text-base leading-snug min-w-0" data-testid={`text-dasakam-name-${stotram.id}`}>
                {stotram.name}
              </h3>
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

function DasakamSkeleton() {
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

export default function NarayaneeyamPage() {
  const [filterLang, setFilterLang] = useState<string | null>(null);

  const { data: category, isLoading: catLoading } = useQuery<Category>({
    queryKey: ["/api/categories", "vishnu"],
  });

  const { data: allStotrams, isLoading: stotLoading } = useQuery<Stotram[]>({
    queryKey: ["/api/categories", "vishnu", "stotrams"],
  });

  const isLoading = catLoading || stotLoading;

  const dasakams = allStotrams
    ?.filter((s) => s.subcategory === "Narayaneeyam")
    .sort((a, b) => {
      const numA = parseInt(a.name.match(/Dasakam (\d+)/)?.[1] || "0");
      const numB = parseInt(b.name.match(/Dasakam (\d+)/)?.[1] || "0");
      return numA - numB;
    });

  const filteredDasakams = dasakams?.filter((s) => {
    if (!filterLang) return true;
    return hasPdf(s, filterLang);
  });

  return (
    <div className="mx-auto max-w-4xl px-4 py-6">
      <Link href="/kavya-lahari/vishnu" data-testid="link-back-vishnu">
        <Button variant="ghost" className="gap-2 mb-4 -ml-2">
          <ArrowLeft className="h-4 w-4" />
          Vishnu Stotrams
        </Button>
      </Link>

      {isLoading ? (
        <div className="space-y-4">
          <div className="space-y-2">
            <Skeleton className="h-7 w-48" />
            <Skeleton className="h-4 w-72" />
          </div>
          {Array.from({ length: 5 }).map((_, i) => (
            <DasakamSkeleton key={i} />
          ))}
        </div>
      ) : (
        <>
          <div className="mb-6">
            <h1 className="text-2xl sm:text-3xl font-bold font-serif" data-testid="text-narayaneeyam-title">
              Narayaneeyam
            </h1>
            <p className="text-sm text-muted-foreground mt-1">
              A sacred composition by Melpathur Narayana Bhattathiri, consisting of 100 dasakams summarizing the Bhagavata Purana
            </p>
          </div>

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

          <div className="text-xs text-muted-foreground mb-4" data-testid="text-dasakam-count">
            {filteredDasakams?.length || 0} dasakam{(filteredDasakams?.length || 0) !== 1 ? "s" : ""} found
          </div>

          <div className="space-y-2">
            {filteredDasakams?.map((stotram) => {
              const num = parseInt(stotram.name.match(/Dasakam (\d+)/)?.[1] || "0");
              return (
                <DasakamRow key={stotram.id} stotram={stotram} index={num} />
              );
            })}
          </div>

          {filteredDasakams?.length === 0 && (
            <div className="text-center py-12">
              <p className="text-muted-foreground">
                No dasakams available for the selected language filter.
              </p>
            </div>
          )}
        </>
      )}
    </div>
  );
}
