import { motion } from "framer-motion";

export default function DonationSevaGramamPage() {
  return (
    <div className="mx-auto max-w-4xl px-4 py-8">
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
      >
        <h1 className="text-2xl sm:text-3xl font-bold font-serif mb-2" data-testid="text-seva-gramam-title">
          Donation: Sanatana Dharma Seva Gramam
        </h1>

        <h3 className="text-lg font-semibold mb-6" data-testid="text-seva-gramam-vision">
          What is the vision of 'Sanatana Dharma Seva Gramam'?
        </h3>

        <div className="space-y-4 text-sm sm:text-base text-muted-foreground leading-relaxed">
          <ul className="list-disc list-inside space-y-2">
            <li>
              <a
                href="/api/pdf?url=https%3A%2F%2Fvedam-nadam.org%2Fwp-content%2Fuploads%2F2023%2F04%2FSanatana-Dharma-Seva-Gramam-A4-size.pdf"
                target="_blank"
                rel="noopener noreferrer"
                className="font-semibold text-primary underline"
                data-testid="link-seva-gramam-telugu-pdf"
              >
                సనాతన ధర్మ సేవా గ్రామం
              </a>{" "}
              వివరాలు
            </li>
          </ul>

          <p>
            Revival and propagation of the Sanatana Dharma among youth and upcoming generations have become a dire need of the hour. It is critical that the right environment and opportunities must develop and made available to youngsters to involve them and provide them with a conducive environment to stay connected and rooted in our culture.
          </p>
          <p>
            With this intention of sowing the seeds of the Sanatana Dharmic way of life among the youth of the modern age & children right from a tender age, Sri Kanchi Kamakoti Peetadhipati Jagadguru Sri Sankara Vijayendra Saraswati Swami has launched this noble and unique service initiative titled as the '<span className="font-semibold text-foreground">Sanatana Dharma Seva Gramam</span>' in Podili near Ongole, Prakasham District, Andhra Pradesh.
          </p>

          <h4 className="text-base font-semibold text-foreground pt-2">Project Overview:</h4>
          <p>
            The project proposes to provide a beautifully integrated education platform, imparting modern education, including studying Vedas, Shastras, and other Dharmic subject areas.
          </p>

          <h4 className="text-base font-semibold text-foreground pt-2">Learning:</h4>
          <ol className="list-decimal list-inside space-y-2 pl-2">
            <li><span className="font-semibold text-foreground">Shri Kanchi Kamakoti Sankara Vidyalaya</span> for general public: CBSE/State syllabus ages from 6th standard to 12th standard.</li>
            <li><span className="font-semibold text-foreground">Shri Kamakshi Skills Development Center:</span> Train and enable local population in skills like – Shilpa kala, Pottery, Horticulture and Agriculture, Tailoring, Electrical, Plumbing, Carpentry, Arts & Crafts, Driving etc.</li>
            <li><span className="font-semibold text-foreground">Shri Chandrasekharendra Saraswathi Institute for Sanskrit and Vedic studies:</span> Propagate Vedic studies with focus on Sanskrit and Sanatana Dharma.</li>
            <li><span className="font-semibold text-foreground">Shri Sankara Advaita Research Center:</span> Research on various aspects of Vedas, Vedangas and Upanishads along with extensive library.</li>
          </ol>

          <h4 className="text-base font-semibold text-foreground pt-2">Living:</h4>
          <ol className="list-decimal list-inside space-y-2 pl-2">
            <li><span className="font-semibold text-foreground">A full-fledged Sri Sankara Hostel</span> for Vedic students and accommodation for Adhyapakas with kitchen and dining facility as per vedic standards combined with modern cooking utilities. Each room will accommodate three students and will house more than 100 students.</li>
            <li>There will be classrooms for Vedic teaching with each classroom named after the <span className="font-semibold text-foreground">Sapta Rishis</span>.</li>
            <li>The halls, auditoriums and exam rooms etc will be appropriately <span className="font-semibold text-foreground">named after great saints of India.</span></li>
            <li><span className="font-semibold text-foreground">A full-fledged guest house</span> for visiting Vedic scholars and faculty.</li>
            <li><span className="font-semibold text-foreground">Sri Jayendra Saraswathi Health Center</span> to provide out-patient services to the local population and health care for students studying in the project complex.</li>
          </ol>

          <h4 className="text-base font-semibold text-foreground pt-2">Cultural Infrastructure:</h4>
          <ol className="list-decimal list-inside space-y-2 pl-2">
            <li>A full-fledged <span className="font-semibold text-foreground">Goshala</span> with emphasis on breeding and rearing rare indian cows and for protection and safety of aged cows.</li>
            <li><span className="font-semibold text-foreground">Yagasala</span> for training and conducting various Homas and Yagas.</li>
            <li><span className="font-semibold text-foreground">Vyayamashala</span> to be named as Hanuman Sports Complex.</li>
            <li><span className="font-semibold text-foreground">Pushpa Vatika</span> with focus on Nakshatra Vanam with plants for each of the 27 stars from Ashwini to Revathi.</li>
            <li>An art and photo <span className="font-semibold text-foreground">gallery and exhibition</span> of Vedic texts and scriptures.</li>
            <li>A <span className="font-semibold text-foreground">yoga center</span> and indoor sports room for indoor games.</li>
          </ol>

          <h4 className="text-base font-semibold text-foreground pt-2">How can I support?</h4>
          <p>
            Our critical responsibility is to teach Sanatana Dharma to our upcoming and future generations. It's time for community individuals to come together and build a strong and sustainable model of value-based education systems of our Sanatana Dharma.
          </p>

          <h4 className="text-base font-semibold text-foreground pt-2">Donation Information:</h4>
          <p>
            Once the form is completed, you will be redirected to <span className="font-semibold text-foreground">KKSFUSA (Kanchi Kamakoti Seva Foundation)</span> PayPal donation page, and no information regarding the transactions will be held by this organization.
          </p>
        </div>
      </motion.div>
    </div>
  );
}
