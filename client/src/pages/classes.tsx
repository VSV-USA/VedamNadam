import { motion } from "framer-motion";

export default function ClassesPage() {
  return (
    <div className="mx-auto max-w-4xl px-4 py-8">
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
      >
        <div className="text-center">
          <h1 className="text-3xl sm:text-4xl font-bold font-serif mb-6" data-testid="text-classes-title">
            Classes
          </h1>
          <p className="text-lg text-muted-foreground" data-testid="text-coming-soon">
            Coming soon&hellip;&hellip;.
          </p>
        </div>
      </motion.div>
    </div>
  );
}
