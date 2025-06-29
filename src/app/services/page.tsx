import Head from 'next/head';

export default function Services() {
  return (
    <>
      <Head>
        <title>Concrete Services | ATX Concrete Contractor</title>
        <meta
          name='description'
          content='Explore our full range of concrete services in Austin & Round Rock, TX. Driveways, patios, foundations, stamped concrete, sidewalks, and more.'
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
      </Head>
      <section style={{ maxWidth: 800, margin: '2rem auto', padding: '0 1rem' }}>
        <h1>Our Concrete Services</h1>
        <p>
          We offer a complete range of concrete services for homes and businesses in Austin, Round Rock, and surrounding areas.
        </p>
        <ul>
          <li><a href='/services/driveways'>Concrete Driveways</a></li>
          <li><a href='/services/patios'>Concrete Patios</a></li>
          <li><a href='/services/foundations'>Foundations</a></li>
          <li><a href='/services/stamped-concrete'>Stamped Concrete</a></li>
          <li><a href='/services/sidewalks'>Sidewalks</a></li>
        </ul>
        <h2>Additional Services</h2>
        <ul>
          <li>Concrete Cutting & Demolition</li>
          <li>Polishing, Resurfacing, Sealing, Staining</li>
          <li>Decorative Concrete</li>
          <li>Foundation Repair</li>
        </ul>
        <p>
          <a href='/contact' style={{ color: '#f7b32b', fontWeight: 'bold' }}>
            Contact us for a free estimate or to discuss your project!
          </a>
        </p>
      </section>
    </>
  );
}