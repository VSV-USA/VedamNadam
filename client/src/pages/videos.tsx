import { Card } from "@/components/ui/card";
import { motion } from "framer-motion";

export default function VideosPage() {
  return (
    <div className="mx-auto max-w-4xl px-4 py-8">
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
      >
        <div className="text-center mb-10">
          <h1 className="text-3xl sm:text-4xl font-bold font-serif mb-3" data-testid="text-videos-title">
            Videos
          </h1>
          <p className="text-muted-foreground max-w-lg mx-auto text-sm sm:text-base">
            Stotram recitation and event videos
          </p>
        </div>

        <div className="space-y-6">
          <Card className="overflow-hidden" data-testid="card-video-youtube">
            <div className="aspect-video">
              <iframe
                src="https://www.youtube.com/embed/4W5x_33yJqk"
                title="Vedam Nadam Video"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowFullScreen
                className="h-full w-full border-0"
                data-testid="iframe-youtube-video"
              />
            </div>
          </Card>

          <Card className="overflow-hidden" data-testid="card-video-sringeri">
            <div className="aspect-video">
              <video
                controls
                preload="metadata"
                poster="/images/gallery/sringeri-math-poster.png"
                className="h-full w-full"
                data-testid="video-sringeri-math"
              >
                <source src="https://vedam-nadam.org/wp-content/uploads/2022/04/Sringeri-Math-April-2022-480.mov" type="video/mp4" />
                Your browser does not support the video tag.
              </video>
            </div>
            <div className="p-3">
              <p className="text-sm font-medium" data-testid="text-sringeri-title">Sringeri Math - April 2022</p>
            </div>
          </Card>
        </div>
      </motion.div>
    </div>
  );
}
