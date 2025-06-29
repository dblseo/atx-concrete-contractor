import Head from 'next/head';

export default function Patios() {
  return (
    <>
      <Head>
        <title>Concrete Patios in Austin & Round Rock, TX | ATX Concrete Contractor</title>
        <meta
          name='description'
          content='Custom concrete patio installation in Austin & Round Rock, TX. Licensed, insured, free estimates. Call (512) 991-9224.'
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
                  'name': 'What are the benefits of a concrete patio?',
                  'acceptedAnswer': {
                    '@type': 'Answer',
                    'text': 'Concrete patios are durable, low-maintenance, and can be customized with decorative finishes to match your style.'
                  }
                },
                {
                  '@type': 'Question',
                  'name': 'Can you add decorative finishes to patios?',
                  'acceptedAnswer': {
                    '@type': 'Answer',
                    'text': 'Yes! We offer stamped, stained, and colored concrete options for a custom look.'
                  }
                }
              ]
            })
          }}
        />
      </Head>
      <section style={{ maxWidth: 800, margin: '2rem auto', padding: '0 1rem' }}>
        <h1>Concrete Patios in Austin & Round Rock, TX</h1>
        <p>
          Transform your outdoor living space with a beautiful, long-lasting concrete patio from ATX Concrete Contractor. We design and build patios for homes and businesses in Austin, Round Rock, and nearby areas.
        </p>
        <h2>Benefits of a Concrete Patio</h2>
        <ul>
          <li>Durable and weather-resistant</li>
          <li>Low maintenance and easy to clean</li>
          <li>Custom shapes, sizes, and finishes</li>
          <li>Perfect for entertaining and relaxing outdoors</li>
        </ul>
        <h2>Our Patio Installation Process</h2>
        <ol>
          <li>Free consultation and design planning</li>
          <li>Site preparation and forming</li>
          <li>Concrete pouring and finishing</li>
          <li>Optional decorative stamping or staining</li>
          <li>Final walkthrough and cleanup</li>
        </ol>
        <h2>Frequently Asked Questions</h2>
        <h3>What are the benefits of a concrete patio?</h3>
        <p>
          Concrete patios are durable, low-maintenance, and can be customized with decorative finishes to match your style.
        </p>
        <h3>Can you add decorative finishes to patios?</h3>
        <p>
          Yes! We offer stamped, stained, and colored concrete options for a custom look.
        </p>
        <p>
          <a href='/contact' style={{ color: '#f7b32b', fontWeight: 'bold' }}>
            Ready for a new patio? Contact us today!
          </a>
        </p>
        <p>
          <a href='/services'>← Back to All Services</a>
        </p>
      </section>
    </>
  );
}