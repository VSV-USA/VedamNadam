import { useQuery } from "@tanstack/react-query";
import { Link } from "wouter";
import { Card } from "@/components/ui/card";
import { Skeleton } from "@/components/ui/skeleton";
import { type Category } from "@shared/schema";
import { motion } from "framer-motion";
import { ArrowRight } from "lucide-react";

const container = {
  hidden: { opacity: 0 },
  show: {
    opacity: 1,
    transition: { staggerChildren: 0.08 },
  },
};

const item = {
  hidden: { opacity: 0, y: 24 },
  show: { opacity: 1, y: 0, transition: { duration: 0.4, ease: "easeOut" } },
};

function CategoryCard({ category }: { category: Category }) {
  return (
    <Link href={`/kavya-lahari/${category.slug}`}>
      <Card
        className="group cursor-pointer overflow-visible hover-elevate active-elevate-2 transition-all duration-300"
        data-testid={`card-category-${category.slug}`}
      >
        <div className="p-4 flex flex-col items-center gap-3">
          <div className="relative w-full aspect-square rounded-md overflow-hidden">
            <img
              src={category.imageUrl}
              alt={category.name}
              className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105"
              loading="lazy"
            />
            <div className="absolute inset-0 bg-gradient-to-t from-black/40 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300" />
          </div>
          <div className="flex items-center gap-2 w-full">
            <h3 className="text-base font-semibold font-serif flex-1 text-center">
              {category.name}
            </h3>
            <ArrowRight className="h-4 w-4 text-muted-foreground shrink-0 invisible group-hover:visible" />
          </div>
          <p className="text-xs text-muted-foreground text-center line-clamp-2">
            {category.description}
          </p>
        </div>
      </Card>
    </Link>
  );
}

function CategorySkeleton() {
  return (
    <Card className="overflow-hidden">
      <div className="p-4 flex flex-col items-center gap-3">
        <Skeleton className="w-full aspect-square rounded-md" />
        <Skeleton className="h-5 w-32" />
        <Skeleton className="h-3 w-full" />
      </div>
    </Card>
  );
}

export default function KavyaLahari() {
  const { data: categories, isLoading } = useQuery<Category[]>({
    queryKey: ["/api/categories"],
  });

  return (
    <div className="mx-auto max-w-6xl px-4 py-8">
      <div className="text-center mb-10">
        <h1 className="text-3xl sm:text-4xl font-bold font-serif mb-3" data-testid="text-page-title">
          Kavya Lahari
        </h1>
        <p className="text-muted-foreground max-w-lg mx-auto text-sm sm:text-base">
          A curated collection of sacred stotrams and devotional hymns, 
          available in Telugu, English, Kannada, and Devanagri.
        </p>
      </div>

      {isLoading ? (
        <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-4">
          {Array.from({ length: 8 }).map((_, i) => (
            <CategorySkeleton key={i} />
          ))}
        </div>
      ) : (
        <motion.div
          variants={container}
          initial="hidden"
          animate="show"
          className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-4"
        >
          {categories?.map((category) => (
            <motion.div key={category.id} variants={item}>
              <CategoryCard category={category} />
            </motion.div>
          ))}
        </motion.div>
      )}
    </div>
  );
}
