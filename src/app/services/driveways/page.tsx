import Head from 'next/head';

export default function Driveways() {
  return (
    <>
      <Head>
        <title>Concrete Driveways in Austin & Round Rock, TX | ATX Concrete Contractor</title>
        <meta
          name='description'
          content='Expert concrete driveway installation & repair in Austin & Round Rock, TX. Licensed, insured, free estimates. Call (512) 991-9224.'
        />
        {/* LocalBusiness JSON-LD Schema */}
        <script
          type='application/ld+json'
          dangerouslySetInnerHTML={{
            __html: JSON.stringify({
              '@context': 'https://schema.org',
              '@type': 'LocalBusiness',
              'name': 'ATX Concrete Contractor',
              'address': {
                '@type': 'PostalAddress',
                'streetAddress': '1000 Heritage Center Circle',
                'addressLocality': 'Round Rock',
                'addressRegion': 'TX',
                'postalCode': '78664'
              },
              'telephone': '(512) 991-9224',
              'areaServed': ['Austin, TX', 'Round Rock, TX'],
              'url': 'https://atxconcretecontractor.com',
              'sameAs': [
                'https://facebook.com/',
                'https://instagram.com/',
                'https://linkedin.com/'
              ]
            })
          }}
        />
        {/* FAQ Schema */}
        <script
          type='application/ld+json'
          dangerouslySetInnerHTML={{
            __html: JSON.stringify({
              '@context': 'https://schema.org',
              '@type': 'FAQPage',
              'mainEntity': [
                {
                  '@type': 'Question',
                  'name': 'How long does a new concrete driveway last?',
                  'acceptedAnswer': {
                    '@type': 'Answer',
                    'text': 'A properly installed and maintained concrete driveway can last 25-30 years or more.'
                  }
                },
                {
                  '@type': 'Question',
                  'name': 'Do you offer free estimates for driveway projects?',
                  'acceptedAnswer': {
                    '@type': 'Answer',
                    'text': 'Yes! We provide free, no-obligation estimates for all concrete driveway installations and repairs.'
                  }
                }
              ]
            })
          }}
        />
      </Head>
      <section style={{ maxWidth: 800, margin: '2rem auto', padding: '0 1rem' }}>
        <h1>Concrete Driveways in Austin & Round Rock, TX</h1>
        <p>
          Upgrade your home’s curb appeal and durability with a professionally installed concrete driveway from ATX Concrete Contractor. We serve Austin, Round Rock, and surrounding areas with expert driveway installation, replacement, and repair.
        </p>
        <h2>Benefits of a New Concrete Driveway</h2>
        <ul>
          <li>Long-lasting and low maintenance</li>
          <li>Boosts property value and curb appeal</li>
          <li>Custom finishes and decorative options available</li>
          <li>Resistant to Texas weather and heavy use</li>
        </ul>
        <h2>Our Driveway Installation Process</h2>
        <ol>
          <li>Free on-site estimate and consultation</li>
          <li>Site preparation and grading</li>
          <li>Professional concrete pouring and finishing</li>
          <li>Cleanup and final inspection</li>
        </ol>
        <h2>Frequently Asked Questions</h2>
        <h3>How long does a new concrete driveway last?</h3>
        <p>
          A properly installed and maintained concrete driveway can last 25-30 years or more.
        </p>
        <h3>Do you offer free estimates for driveway projects?</h3>
        <p>
          Yes! We provide free, no-obligation estimates for all concrete driveway installations and repairs.
        </p>
        <p>
          <a href='/contact' style={{ color: '#f7b32b', fontWeight: 'bold' }}>
            Ready for a new driveway? Contact us today!
          </a>
        </p>
        <p>
          <a href='/services'>← Back to All Services</a>
        </p>
      </section>
    </>
  );
}