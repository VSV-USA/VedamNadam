import { Link } from "wouter";

export function Footer() {
  return (
    <footer className="border-t bg-card">
      <div className="mx-auto max-w-6xl px-4 py-8">
        <div className="flex flex-col sm:flex-row items-center sm:items-start justify-between gap-6">
          <div className="flex flex-col items-center sm:items-start gap-3">
            <Link href="/">
              <div className="flex items-center gap-2 cursor-pointer">
                <img
                  src="/images/vedam-nadam-logo.png"
                  alt="Vedam Nadam"
                  className="h-8 w-auto"
                  data-testid="img-footer-logo"
                />
              </div>
            </Link>
            <p className="max-w-sm text-xs text-muted-foreground text-center sm:text-left leading-relaxed">
              A 501(C)(3) Non-Profit religious and charitable organization founded in USA, dedicated to fostering Sanatana Dharma among global communities.
              EIN: 88-0971592
            </p>
          </div>

          <div className="flex flex-col items-center sm:items-end gap-2">
            <nav className="flex items-center gap-3 flex-wrap justify-center" data-testid="nav-footer">
              <Link href="/kavya-lahari" className="text-xs text-muted-foreground hover:text-foreground transition-colors">
                Kavya Lahari
              </Link>
              <Link href="/gallery" className="text-xs text-muted-foreground hover:text-foreground transition-colors">
                Gallery
              </Link>
              <Link href="/donations" className="text-xs text-muted-foreground hover:text-foreground transition-colors">
                Donations
              </Link>
              <Link href="/events" className="text-xs text-muted-foreground hover:text-foreground transition-colors">
                Events
              </Link>
              <Link href="/classes" className="text-xs text-muted-foreground hover:text-foreground transition-colors">
                Classes
              </Link>
              <Link href="/contact" className="text-xs text-muted-foreground hover:text-foreground transition-colors">
                Contact
              </Link>
              <Link href="/about" className="text-xs text-muted-foreground hover:text-foreground transition-colors">
                About
              </Link>
            </nav>
          </div>
        </div>
      </div>
    </footer>
  );
}
