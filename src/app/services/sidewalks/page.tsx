import Head from 'next/head';

export default function Sidewalks() {
  return (
    <>
      <Head>
        <title>Concrete Sidewalks in Austin & Round Rock, TX | ATX Concrete Contractor</title>
        <meta
          name='description'
          content='Concrete sidewalk installation and repair in Austin & Round Rock, TX. Licensed, insured, free estimates. Call (512) 991-9224.'
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
                  'name': 'Do you repair existing sidewalks?',
                  'acceptedAnswer': {
                    '@type': 'Answer',
                    'text': 'Yes, we repair and replace damaged or uneven sidewalks for safety and appearance.'
                  }
                },
                {
                  '@type': 'Question',
                  'name': 'Are your sidewalks ADA compliant?',
                  'acceptedAnswer': {
                    '@type': 'Answer',
                    'text': 'Yes, we build sidewalks to meet ADA and local code requirements.'
                  }
                }
              ]
            })
          }}
        />
      </Head>
      <section style={{ maxWidth: 800, margin: '2rem auto', padding: '0 1rem' }}>
        <h1>Concrete Sidewalks in Austin & Round Rock, TX</h1>
        <p>
          ATX Concrete Contractor installs and repairs sidewalks for homes, businesses, and public spaces in Austin, Round Rock, and nearby communities.
        </p>
        <h2>Benefits of a New Sidewalk</h2>
        <ul>
          <li>Safe, smooth pedestrian access</li>
          <li>Improves curb appeal and property value</li>
          <li>Durable and weather-resistant</li>
          <li>ADA compliant and code-approved</li>
        </ul>
        <h2>Our Sidewalk Process</h2>
        <ol>
          <li>Free estimate and site assessment</li>
          <li>Removal of old/damaged concrete (if needed)</li>
          <li>Forming, pouring, and finishing new sidewalk</li>
          <li>Final inspection and cleanup</li>
        </ol>
        <h2>Frequently Asked Questions</h2>
        <h3>Do you repair existing sidewalks?</h3>
        <p>
          Yes, we repair and replace damaged or uneven sidewalks for safety and appearance.
        </p>
        <h3>Are your sidewalks ADA compliant?</h3>
        <p>
          Yes, we build sidewalks to meet ADA and local code requirements.
        </p>
        <p>
          <a href='/contact' style={{ color: '#f7b32b', fontWeight: 'bold' }}>
            Need a new sidewalk? Contact us today!
          </a>
        </p>
        <p>
          <a href='/services'>← Back to All Services</a>
        </p>
      </section>
    </>
  );
}