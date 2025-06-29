import Head from 'next/head';
import GalleryGrid from '../../components/GalleryGrid';

export default function Projects() {
  return (
    <>
      <Head>
        <title>Project Gallery | ATX Concrete Contractor</title>
        <meta
          name='description'
          content='View our concrete projects in Austin & Round Rock, TX. Driveways, patios, foundations, stamped concrete, and more.'
        />
      </Head>
      <section style={{ maxWidth: 900, margin: '2rem auto', padding: '0 1rem' }}>
        <h1>Our Project Gallery</h1>
        <p>
          Explore some of our recent concrete work in the Austin and Round Rock area. We take pride in every project!
        </p>
        <GalleryGrid />
        <p>
          <a href='/contact' style={{ color: '#f7b32b', fontWeight: 'bold' }}>
            Like what you see? Contact us for a free estimate!
          </a>
        </p>
      </section>
    </>
  );
}