import { Switch, Route } from "wouter";
import { queryClient } from "./lib/queryClient";
import { QueryClientProvider } from "@tanstack/react-query";
import { Toaster } from "@/components/ui/toaster";
import { TooltipProvider } from "@/components/ui/tooltip";
import { ThemeProvider } from "@/components/theme-provider";
import { Header } from "@/components/header";
import { Footer } from "@/components/footer";
import Landing from "@/pages/landing";
import KavyaLahari from "@/pages/kavya-lahari";
import CategoryPage from "@/pages/category";
import SearchPage from "@/pages/search";
import ClassesPage from "@/pages/classes";
import EventsPage from "@/pages/events";
import GalleryPage from "@/pages/gallery";
import ImagesPage from "@/pages/images";
import VideosPage from "@/pages/videos";
import ContactPage from "@/pages/contact";
import DonationsPage from "@/pages/donations";
import DonationSevaGramamPage from "@/pages/donation-seva-gramam";
import AboutPage from "@/pages/about";
import NarayaneeyamPage from "@/pages/narayaneeyam";
import NotFound from "@/pages/not-found";

function Router() {
  return (
    <Switch>
      <Route path="/" component={Landing} />
      <Route path="/kavya-lahari" component={KavyaLahari} />
      <Route path="/kavya-lahari/vishnu/narayaneeyam" component={NarayaneeyamPage} />
      <Route path="/kavya-lahari/:slug" component={CategoryPage} />
      <Route path="/search" component={SearchPage} />
      <Route path="/classes" component={ClassesPage} />
      <Route path="/events" component={EventsPage} />
      <Route path="/gallery" component={GalleryPage} />
      <Route path="/images" component={ImagesPage} />
      <Route path="/videos" component={VideosPage} />
      <Route path="/contact" component={ContactPage} />
      <Route path="/donations" component={DonationsPage} />
      <Route path="/donation-sanatana-dharma-seva" component={DonationSevaGramamPage} />
      <Route path="/about" component={AboutPage} />
      <Route component={NotFound} />
    </Switch>
  );
}

function App() {
  return (
    <QueryClientProvider client={queryClient}>
      <TooltipProvider>
        <ThemeProvider>
          <div className="flex flex-col min-h-screen">
            <Header />
            <main className="flex-1">
              <Router />
            </main>
            <Footer />
          </div>
          <Toaster />
        </ThemeProvider>
      </TooltipProvider>
    </QueryClientProvider>
  );
}

export default App;
