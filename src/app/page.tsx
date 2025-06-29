import Hero from "../components/Hero";
import Head from "next/head";

export default function Home() {
  return (
    <>
      <Head>
        <title>Concrete Contractor in Austin & Round Rock, TX | ATX Concrete Contractor</title>
        <meta
          name="description"
          content="Licensed & insured concrete contractor in Round Rock, TX. Driveways, patios, foundations, stamped concrete & more. Free estimates. Serving Austin, TX area."
        />
        {/* LocalBusiness JSON-LD Schema */}
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify({
              "@context": "https://schema.org",
              "@type": "LocalBusiness",
              "name": "ATX Concrete Contractor",
              "address": {
                "@type": "PostalAddress",
                "streetAddress": "1000 Heritage Center Circle",
                "addressLocality": "Round Rock",
                "addressRegion": "TX",
                "postalCode": "78664"
              },
              "telephone": "(512) 991-9224",
              "areaServed": ["Austin, TX", "Round Rock, TX"],
              "url": "https://atxconcretecontractor.com",
              "sameAs": [
                "https://facebook.com/",
                "https://instagram.com/",
                "https://linkedin.com/"
              ]
            })
          }}
        />
        {/* FAQ Schema */}
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify({
              "@context": "https://schema.org",
              "@type": "FAQPage",
              "mainEntity": [
                {
                  "@type": "Question",
                  "name": "What areas do you serve?",
                  "acceptedAnswer": {
                    "@type": "Answer",
                    "text": "We serve Round Rock, Austin, and surrounding areas in Central Texas."
                  }
                },
                {
                  "@type": "Question",
                  "name": "Are you licensed and insured?",
                  "acceptedAnswer": {
                    "@type": "Answer",
                    "text": "Yes, ATX Concrete Contractor is fully licensed and insured for your peace of mind."
                  }
                }
              ]
            })
          }}
        />
      </Head>
      <Hero />
      <section style={{ maxWidth: 800, margin: "2rem auto", padding: "0 1rem" }}>
        <h2>Concrete Contractor in Austin & Round Rock, TX</h2>
        <p>
          ATX Concrete Contractor is your trusted, licensed, and insured concrete expert serving Round Rock, Austin, and surrounding areas. We specialize in driveways, patios, foundations, stamped concrete, sidewalks, and more for both residential and commercial clients.
        </p>
        <ul>
          <li>Free estimates & local expertise</li>
          <li>High-quality materials & craftsmanship</li>
          <li>Serving Austin, Round Rock, Cedar Park, Pflugerville, Georgetown, and more</li>
        </ul>
        <h3>Our Services</h3>
        <ul>
          <li><a href="/services/driveways">Concrete Driveways</a></li>
          <li><a href="/services/patios">Concrete Patios</a></li>
          <li><a href="/services/foundations">Foundations</a></li>
          <li><a href="/services/stamped-concrete">Stamped Concrete</a></li>
          <li><a href="/services/sidewalks">Sidewalks</a></li>
          <li><a href="/services">All Services</a></li>
        </ul>
        <h3>Why Choose Us?</h3>
        <ul>
          <li>Decades of experience</li>
          <li>Licensed & insured</li>
          <li>Local, friendly, and professional</li>
          <li>Customer satisfaction guaranteed</li>
        </ul>
        <p>
          <a href="/contact" style={{ color: "#f7b32b", fontWeight: "bold" }}>
            Contact us today for your free estimate!
          </a>
        </p>
      </section>
    </>
  );
}