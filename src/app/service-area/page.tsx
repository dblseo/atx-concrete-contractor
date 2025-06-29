import Head from 'next/head';

export default function ServiceArea() {
  return (
    <>
      <Head>
        <title>Service Area | ATX Concrete Contractor</title>
        <meta
          name='description'
          content='ATX Concrete Contractor serves Round Rock, Austin, and surrounding neighborhoods. See our full service area here.'
        />
      </Head>
      <section style={{ maxWidth: 800, margin: '2rem auto', padding: '0 1rem' }}>
        <h1>Our Service Area</h1>
        <p>
          ATX Concrete Contractor proudly serves Round Rock, Austin, and the surrounding Central Texas communities.
        </p>
        <h2>We Serve:</h2>
        <ul>
          <li>Round Rock</li>
          <li>Austin (all neighborhoods)</li>
          <li>Cedar Park</li>
          <li>Pflugerville</li>
          <li>Georgetown</li>
          <li>Hutto</li>
          <li>Leander</li>
          <li>Brushy Creek</li>
          <li>Wells Branch</li>
          <li>And more!</li>
        </ul>
        <p>
          <a href='/contact' style={{ color: '#f7b32b', fontWeight: 'bold' }}>
            Not sure if we serve your area? Contact us!
          </a>
        </p>
      </section>
    </>
  );
}