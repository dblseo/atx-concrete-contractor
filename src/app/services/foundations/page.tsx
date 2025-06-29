import Head from 'next/head';

export default function Foundations() {
  return (
    <>
      <Head>
        <title>Concrete Foundations in Austin & Round Rock, TX | ATX Concrete Contractor</title>
        <meta
          name='description'
          content='Expert concrete foundation installation in Austin & Round Rock, TX. Licensed, insured, free estimates. Call (512) 991-9224.'
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
                  'name': 'What types of foundations do you install?',
                  'acceptedAnswer': {
                    '@type': 'Answer',
                    'text': 'We install slab, pier and beam, and custom concrete foundations for homes and businesses.'
                  }
                },
                {
                  '@type': 'Question',
                  'name': 'Do you offer foundation repair?',
                  'acceptedAnswer': {
                    '@type': 'Answer',
                    'text': 'Yes, we provide expert foundation repair and reinforcement services.'
                  }
                }
              ]
            })
          }}
        />
      </Head>
      <section style={{ maxWidth: 800, margin: '2rem auto', padding: '0 1rem' }}>
        <h1>Concrete Foundations in Austin & Round Rock, TX</h1>
        <p>
          ATX Concrete Contractor provides expert concrete foundation installation and repair for residential and commercial projects in Austin, Round Rock, and surrounding areas.
        </p>
        <h2>Benefits of a Quality Foundation</h2>
        <ul>
          <li>Stable, long-lasting support for your structure</li>
          <li>Engineered for Texas soil and climate</li>
          <li>Prevents settling and structural issues</li>
          <li>Licensed, insured, and code-compliant</li>
        </ul>
        <h2>Our Foundation Process</h2>
        <ol>
          <li>Site evaluation and soil analysis</li>
          <li>Custom engineering and design</li>
          <li>Excavation, forming, and reinforcement</li>
          <li>Concrete pour and curing</li>
          <li>Final inspection and cleanup</li>
        </ol>
        <h2>Frequently Asked Questions</h2>
        <h3>What types of foundations do you install?</h3>
        <p>
          We install slab, pier and beam, and custom concrete foundations for homes and businesses.
        </p>
        <h3>Do you offer foundation repair?</h3>
        <p>
          Yes, we provide expert foundation repair and reinforcement services.
        </p>
        <p>
          <a href='/contact' style={{ color: '#f7b32b', fontWeight: 'bold' }}>
            Need a new foundation? Contact us today!
          </a>
        </p>
        <p>
          <a href='/services'>← Back to All Services</a>
        </p>
      </section>
    </>
  );
}