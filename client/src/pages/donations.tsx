import { Card } from "@/components/ui/card";
import { Link } from "wouter";
import { motion } from "framer-motion";

export default function DonationsPage() {
  return (
    <div className="mx-auto max-w-4xl px-4 py-8">
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
      >
        <div className="text-center mb-10">
          <h1 className="text-3xl sm:text-4xl font-bold font-serif mb-6" data-testid="text-donations-title">
            Donations
          </h1>
        </div>

        <div className="max-w-3xl mx-auto space-y-4 text-sm sm:text-base leading-relaxed text-muted-foreground mb-10">
          <p>
            As we live our lives, we are called to make a positive impact on the world around us. Our faith teaches us to be compassionate, to love our neighbors as ourselves, and to help those in need.
          </p>
          <p>
            One way we can do this is by supporting a religious cause that aligns with our values. Whether it's providing food and shelter to the homeless, supporting orphanages and schools, or funding missionary work, every donation we make can make a significant difference.
          </p>
          <p>
            By donating, we are not only fulfilling our religious duty, but we are also contributing to a better world for all of us. Our faith teaches us that every little act of kindness and generosity can make a positive impact on the world.
          </p>
          <p>
            So let us come together and donate to a religious cause that we believe in. Let us make a positive impact on the world and spread the love and compassion that our faith teaches us.
          </p>
          <p>
            Thank you for your generosity and support. May our contributions bring blessings to those in need and bring us closer to our Creator.
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          <Card className="p-6" data-testid="card-donation-kksfusa">
            <h2 className="text-xl font-bold font-serif mb-4" data-testid="text-kksfusa-title">
              Kanchi Kamakoti Seva Foundation
            </h2>
            <ul className="list-disc list-inside space-y-2 text-sm text-muted-foreground leading-relaxed">
              <li>
                <span className="font-semibold text-foreground">Mission:</span>{" "}
                <span className="font-semibold text-foreground">Sanatana Dharma Seva Gramam</span>{" "}
                (<a
                  href="/api/pdf?url=https%3A%2F%2Fvedam-nadam.org%2Fwp-content%2Fuploads%2F2023%2F04%2FSanatana-Dharma-Seva-Gramam-A4-size.pdf"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="font-semibold text-primary underline"
                  data-testid="link-seva-gramam-telugu"
                >
                  సనాతన ధర్మ సేవా గ్రామం
                </a>)
              </li>
              <li>
                Donation related information can be found{" "}
                <Link
                  href="/donation-sanatana-dharma-seva"
                  className="font-semibold text-primary underline"
                  data-testid="link-donation-here"
                >
                  here.
                </Link>
              </li>
            </ul>
          </Card>

          <Card className="p-6" data-testid="card-donation-vedamnadam">
            <h2 className="text-xl font-bold font-serif mb-4" data-testid="text-vedamnadam-donation-title">
              Vedam Nadam Organization
            </h2>
            <p className="text-sm text-muted-foreground leading-relaxed">
              Vedam Nadam organization solicits generous contributions from the public to carry out its objectives. Contributions can be made via Zelle Pay at{" "}
              <a
                href="mailto:anuradhachivukula@yahoo.com"
                className="text-primary underline"
                data-testid="link-zelle-email"
              >
                anuradhachivukula@yahoo.com
              </a>.
            </p>
          </Card>
        </div>
      </motion.div>
    </div>
  );
}
