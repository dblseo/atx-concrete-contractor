import Head from 'next/head';

export default function About() {
  return (
    <>
      <Head>
        <title>About Us | ATX Concrete Contractor</title>
        <meta
          name='description'
          content='Learn about ATX Concrete Contractor, your trusted, licensed, and insured concrete experts serving Round Rock, Austin, and Central Texas.'
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
        <h1>About ATX Concrete Contractor</h1>
        <p>
          ATX Concrete Contractor is a locally owned and operated business based in Round Rock, TX, proudly serving the greater Austin area. With decades of experience, our team is dedicated to delivering top-quality concrete solutions for residential and commercial clients.
        </p>
        <ul>
          <li>Licensed & insured for your peace of mind</li>
          <li>Free estimates and honest pricing</li>
          <li>Skilled, friendly, and professional crew</li>
          <li>Committed to customer satisfaction and local trust</li>
        </ul>
        <h2>Our Mission</h2>
        <p>
          To provide reliable, high-quality concrete services that enhance the value, safety, and beauty of your property.
        </p>
        <h2>Why Choose Us?</h2>
        <ul>
          <li>Decades of experience in Central Texas</li>
          <li>Attention to detail and quality craftsmanship</li>
          <li>Responsive communication and timely project completion</li>
        </ul>
        <p>
          <a href='/contact' style={{ color: '#f7b32b', fontWeight: 'bold' }}>
            Contact us today to learn more or request your free estimate!
          </a>
        </p>
      </section>
    </>
  );
}