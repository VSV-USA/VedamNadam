import { Link } from "wouter";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { BookOpen, Heart, GraduationCap, Stethoscope, Users, ArrowRight } from "lucide-react";
import { motion } from "framer-motion";

const missionPoints = [
  { icon: Heart, title: "Cultural Preservation", description: "Promote and preserve Sanatana Dharma among global communities around the world" },
  { icon: BookOpen, title: "Vedic Literature", description: "Teach Vedic Literature and support spiritual learning for all seekers" },
  { icon: GraduationCap, title: "Vedic Patashalas", description: "Provide support for Vedic Patashalas and traditional education centers" },
  { icon: Stethoscope, title: "Medical Care", description: "Medical care support for the needy in communities across India and USA" },
  { icon: Users, title: "Community Service", description: "Participate in humanitarian, charitable community service with Dharma as our motto" },
];

const container = {
  hidden: { opacity: 0 },
  show: { opacity: 1, transition: { staggerChildren: 0.1 } },
};

const item = {
  hidden: { opacity: 0, y: 20 },
  show: { opacity: 1, y: 0, transition: { duration: 0.5, ease: "easeOut" } },
};

export default function Landing() {
  return (
    <div>
      <section className="relative overflow-hidden">
        <div className="absolute inset-0">
          <img
            src="/images/hero-banner.jpg"
            alt="Vedam Nadam - Collage of sacred deities and spiritual imagery"
            className="h-full w-full object-cover"
            data-testid="img-hero-banner"
          />
          <div className="absolute inset-0 bg-gradient-to-b from-black/60 via-black/50 to-black/70" />
        </div>
        <div className="relative mx-auto max-w-6xl px-4 py-20 sm:py-28">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
            className="text-center"
          >
            <h1 className="text-4xl sm:text-5xl lg:text-6xl font-bold font-serif mb-4 text-white drop-shadow-lg" data-testid="text-site-title">
              Vedam Nadam
            </h1>
            <p className="text-lg sm:text-xl text-white/90 max-w-2xl mx-auto mb-3 drop-shadow">
              A 501(C)(3) Non-Profit religious and charitable organization founded in USA
            </p>
            <p className="text-sm text-white/75 max-w-xl mx-auto mb-8 drop-shadow">
              Fostering Sanatana Dharma among global communities around the world, in the USA & India in particular.
            </p>
            <div className="flex items-center justify-center gap-3 flex-wrap">
              <Link href="/kavya-lahari">
                <Button className="gap-2" data-testid="button-explore-stotrams">
                  <BookOpen className="h-4 w-4" />
                  Explore Stotrams
                </Button>
              </Link>
              <Link href="/contact">
                <Button variant="outline" className="gap-2 bg-white/10 backdrop-blur-sm text-white border-white/30" data-testid="button-contact-us">
                  Contact Us
                </Button>
              </Link>
            </div>
          </motion.div>
        </div>
      </section>

      <section className="mx-auto max-w-6xl px-4 py-12 sm:py-16">
        <div className="text-center mb-10">
          <h2 className="text-2xl sm:text-3xl font-bold font-serif mb-3" data-testid="text-mission-title">
            Our Mission
          </h2>
          <p className="text-muted-foreground max-w-lg mx-auto text-sm sm:text-base">
            The core mission of this organization is to foster our Sanatana Dharma among core global communities.
          </p>
        </div>

        <motion.div
          variants={container}
          initial="hidden"
          whileInView="show"
          viewport={{ once: true, amount: 0.2 }}
          className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4"
        >
          {missionPoints.map((point) => (
            <motion.div key={point.title} variants={item}>
              <Card className="p-5 h-full hover-elevate">
                <div className="flex items-start gap-4">
                  <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-md bg-primary/10 text-primary">
                    <point.icon className="h-5 w-5" />
                  </div>
                  <div>
                    <h3 className="font-semibold text-sm mb-1">{point.title}</h3>
                    <p className="text-xs text-muted-foreground leading-relaxed">{point.description}</p>
                  </div>
                </div>
              </Card>
            </motion.div>
          ))}
        </motion.div>
      </section>

      <section className="border-t">
        <div className="mx-auto max-w-6xl px-4 py-12 sm:py-16">
          <div className="text-center mb-8">
            <h2 className="text-2xl sm:text-3xl font-bold font-serif mb-3">
              Kavya Lahari
            </h2>
            <p className="text-muted-foreground max-w-lg mx-auto text-sm sm:text-base">
              A curated collection of sacred stotrams and devotional hymns, available in Telugu, English, Kannada, and Devanagri.
            </p>
          </div>
          <div className="flex justify-center">
            <Link href="/kavya-lahari">
              <Button variant="outline" className="gap-2" data-testid="button-view-kavya-lahari">
                Browse All Stotrams
                <ArrowRight className="h-4 w-4" />
              </Button>
            </Link>
          </div>
        </div>
      </section>
    </div>
  );
}
