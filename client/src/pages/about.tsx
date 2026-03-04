import { Card } from "@/components/ui/card";
import { motion } from "framer-motion";

const boardMembers = [
  "Sriram Chivukula",
  "Lakshmi Putcha",
  "Srivalli Pillutla",
  "Sitaram Puranam",
  "Prabha Puranam",
  "Krishna Cheruvu",
  "Meer Abdulla",
];

export default function AboutPage() {
  return (
    <div className="mx-auto max-w-4xl px-4 py-8">
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
      >
        <div className="mb-10">
          <h2 className="text-2xl sm:text-3xl font-bold font-serif mb-6" data-testid="text-founding-director-title">
            Founding Director
          </h2>
          <Card className="p-6 overflow-visible">
            <div className="flex flex-col items-center mb-6">
              <div className="w-56 h-56 sm:w-72 sm:h-72 overflow-hidden rounded-md border-4 border-primary/20 shadow-md">
                <img
                  src="/images/anuradha-guru.jpg"
                  alt="Srimati Anuradha Chivukula - Founding Director"
                  className="h-full w-full object-cover object-[70%_top]"
                  data-testid="img-founding-director"
                />
              </div>
              <p className="mt-3 text-base font-semibold text-foreground" data-testid="text-director-name">
                Srimati Anuradha Chivukula
              </p>
            </div>
            <div className="space-y-4 text-sm sm:text-base text-muted-foreground leading-relaxed">
              <p>
                <span className="font-semibold text-foreground">Srimati Anuradha Chivukula</span> hails from a traditional family from Machilipatnam, Andhra Pradesh, India. Her father Sri Puranam Ramakrishna Sastry garu has been an ardent devotee of Sri Paramacharya and the Kanchi kamakoti Peetham for the past 60+ years. Anuradha garu has been living in the Raleigh, North Carolina, USA, for the past 30+ years. She has been an integral part of the Raleigh area's cultural organizations by organizing Tyagaraja Aradhana, Annamayya Jayanthi, and Paramacharya Jayanthi just to name a few. She is also a volunteer & co-ordinator of Kanchi Kamakoti Seva Foundation North Carolina chapter.
              </p>
              <p>
                Anuradha garu has been teaching Soundarya Lahari and Sivananda Lahari to the age group of 6-80 years old, and she has students from all around U.S.A. and India.
              </p>
            </div>
          </Card>
        </div>

        <div>
          <h2 className="text-2xl sm:text-3xl font-bold font-serif mb-4" data-testid="text-board-members-title">
            Board Members
          </h2>
          <Card className="p-6" data-testid="card-board-members">
            <ul className="list-disc list-inside space-y-2 text-sm sm:text-base text-muted-foreground">
              {boardMembers.map((member) => (
                <li key={member} data-testid={`text-board-member-${member.toLowerCase().replace(/\s+/g, "-")}`}>
                  {member}
                </li>
              ))}
            </ul>
          </Card>
        </div>
      </motion.div>
    </div>
  );
}
