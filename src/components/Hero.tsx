import styles from "./Hero.module.css";
import Link from "next/link";

export default function Hero() {
  return (
    <section className={styles.hero}>
      <div className={styles.content}>
        <h1>ATX Concrete Contractor</h1>
        <p>
          Concrete Driveways, Patios, Foundations & More<br />
          Serving Round Rock & Greater Austin, TX
        </p>
        <Link href="/contact" className={styles.cta}>
          Get a Free Estimate
        </Link>
      </div>
    </section>
  );
}