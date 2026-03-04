import { Link } from "wouter";
import { Button } from "@/components/ui/button";
import { ArrowLeft } from "lucide-react";

export default function NotFound() {
  return (
    <div className="flex flex-col items-center justify-center py-24 px-4 text-center">
      <h1 className="text-6xl font-bold font-serif text-muted-foreground/30 mb-4">404</h1>
      <p className="text-lg text-muted-foreground mb-6">
        This page could not be found.
      </p>
      <Link href="/">
        <Button variant="outline" className="gap-2" data-testid="button-go-home">
          <ArrowLeft className="h-4 w-4" />
          Back to Home
        </Button>
      </Link>
    </div>
  );
}
