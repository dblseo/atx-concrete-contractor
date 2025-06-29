import Head from 'next/head';

export default function StampedConcrete() {
  return (
    <>
      <Head>
        <title>Stamped Concrete in Austin & Round Rock, TX | ATX Concrete Contractor</title>
        <meta
          name='description'
          content='Decorative stamped concrete patios, driveways, and walkways in Austin & Round Rock, TX. Licensed, insured, free estimates. Call (512) 991-9224.'
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
                  'name': 'What is stamped concrete?',
                  'acceptedAnswer': {
                    '@type': 'Answer',
                    'text': 'Stamped concrete is concrete that is patterned and/or textured to resemble brick, stone, tile, or other materials.'
                  }
                },
                {
                  '@type': 'Question',
                  'name': 'Where can stamped concrete be used?',
                  'acceptedAnswer': {
                    '@type': 'Answer',
                    'text': 'Stamped concrete is ideal for patios, driveways, walkways, and pool decks.'
                  }
                }
              ]
            })
          }}
        />
      </Head>
      <section style={{ maxWidth: 800, margin: '2rem auto', padding: '0 1rem' }}>
        <h1>Stamped Concrete in Austin & Round Rock, TX</h1>
        <p>
          Add beauty and value to your property with decorative stamped concrete from ATX Concrete Contractor. We offer a variety of patterns and colors for patios, driveways, walkways, and more.
        </p>
        <h2>Benefits of Stamped Concrete</h2>
        <ul>
          <li>Custom patterns and colors</li>
          <li>Durable and weather-resistant</li>
          <li>Affordable alternative to natural stone or pavers</li>
          <li>Low maintenance</li>
        </ul>
        <h2>Our Stamped Concrete Process</h2>
        <ol>
          <li>Design consultation and pattern selection</li>
          <li>Site prep and forming</li>
          <li>Concrete pour, coloring, and stamping</li>
          <li>Sealing and finishing</li>
        </ol>
        <h2>Frequently Asked Questions</h2>
        <h3>What is stamped concrete?</h3>
        <p>
          Stamped concrete is concrete that is patterned and/or textured to resemble brick, stone, tile, or other materials.
        </p>
        <h3>Where can stamped concrete be used?</h3>
        <p>
          Stamped concrete is ideal for patios, driveways, walkways, and pool decks.
        </p>
        <p>
          <a href='/contact' style={{ color: '#f7b32b', fontWeight: 'bold' }}>
            Interested in stamped concrete? Contact us today!
          </a>
        </p>
        <p>
          <a href='/services'>← Back to All Services</a>
        </p>
      </section>
    </>
  );
}