import { Link } from "wouter";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Image, Play } from "lucide-react";
import { motion } from "framer-motion";

export default function GalleryPage() {
  return (
    <div className="mx-auto max-w-4xl px-4 py-8">
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
      >
        <div className="text-center mb-10">
          <h1 className="text-3xl sm:text-4xl font-bold font-serif mb-3" data-testid="text-gallery-title">
            Gallery
          </h1>
          <p className="text-muted-foreground max-w-lg mx-auto text-sm sm:text-base">
            Photos from our events and gatherings, and stotram recitation videos
          </p>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 gap-6 max-w-2xl mx-auto">
          <Link href="/images">
            <Card className="overflow-visible hover-elevate cursor-pointer" data-testid="card-images-link">
              <div className="aspect-[4/3] overflow-hidden rounded-t-md">
                <img
                  src="/images/gallery/1.webp"
                  alt="Event photos preview"
                  className="h-full w-full object-cover"
                  data-testid="img-images-preview"
                />
              </div>
              <div className="p-4 text-center">
                <h2 className="text-lg font-semibold font-serif mb-1">Images</h2>
                <p className="text-xs text-muted-foreground mb-3">
                  20 photos from events and gatherings
                </p>
                <Button className="gap-2" data-testid="button-view-images">
                  <Image className="h-4 w-4" />
                  View Images
                </Button>
              </div>
            </Card>
          </Link>

          <Link href="/videos">
            <Card className="overflow-visible hover-elevate cursor-pointer" data-testid="card-videos-link">
              <div className="aspect-[4/3] overflow-hidden rounded-t-md relative">
                <img
                  src="/images/gallery/sringeri-math-poster.png"
                  alt="Videos preview"
                  className="h-full w-full object-cover"
                  data-testid="img-videos-preview"
                />
                <div className="absolute inset-0 flex items-center justify-center bg-black/30">
                  <div className="flex h-14 w-14 items-center justify-center rounded-full bg-white/90 text-primary">
                    <Play className="h-7 w-7 ml-1" />
                  </div>
                </div>
              </div>
              <div className="p-4 text-center">
                <h2 className="text-lg font-semibold font-serif mb-1">Videos</h2>
                <p className="text-xs text-muted-foreground mb-3">
                  Stotram recitation and event videos
                </p>
                <Button className="gap-2" data-testid="button-view-videos">
                  <Play className="h-4 w-4" />
                  View Videos
                </Button>
              </div>
            </Card>
          </Link>
        </div>
      </motion.div>
    </div>
  );
}
