import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Mail } from "lucide-react";
import { motion } from "framer-motion";

export default function ContactPage() {
  return (
    <div className="mx-auto max-w-4xl px-4 py-8">
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
      >
        <div className="text-center mb-10">
          <h1 className="text-3xl sm:text-4xl font-bold font-serif mb-3" data-testid="text-contact-title">
            Contact Us
          </h1>
          <p className="text-muted-foreground max-w-lg mx-auto text-sm sm:text-base">
            Get in touch with the Vedam Nadam organization
          </p>
        </div>

        <div className="max-w-md mx-auto">
          <Card className="p-6" data-testid="card-contact-email">
            <div className="flex items-start gap-4">
              <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-md bg-primary/10 text-primary">
                <Mail className="h-5 w-5" />
              </div>
              <div>
                <h3 className="font-semibold text-sm mb-1">Email</h3>
                <p className="text-sm text-muted-foreground mb-3">
                  For any questions and enquiries about Vedam Nadam organization, please contact Anuradha Chivukula by sending an email at:
                </p>
                <a href="mailto:anuradhachivukula@yahoo.com">
                  <Button variant="outline" className="gap-2 text-sm" data-testid="button-email">
                    <Mail className="h-4 w-4" />
                    anuradhachivukula@yahoo.com
                  </Button>
                </a>
              </div>
            </div>
          </Card>
        </div>
      </motion.div>
    </div>
  );
}
