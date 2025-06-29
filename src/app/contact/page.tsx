import Head from 'next/head';
import ContactForm from '../../components/ContactForm';

export default function Contact() {
  return (
    <>
      <Head>
        <title>Contact | ATX Concrete Contractor</title>
        <meta
          name='description'
          content='Contact ATX Concrete Contractor for a free estimate on concrete services in Austin & Round Rock, TX. Call (512) 991-9224.'
        />
      </Head>
      <section style={{ maxWidth: 800, margin: '2rem auto', padding: '0 1rem' }}>
        <h1>Contact ATX Concrete Contractor</h1>
        <p>
          Ready to start your concrete project? Call us at <a href='tel:5129919224'>(512) 991-9224</a> or fill out the form below for a free estimate.
        </p>
        <ContactForm />
        <div style={{ margin: '2rem 0' }}>
          <iframe
            title='Austin TX Map'
            src='https://www.google.com/maps?q=Austin,+TX&output=embed'
            width='100%'
            height='300'
            style={{ border: 0, borderRadius: '12px' }}
            allowFullScreen
            loading='lazy'
          ></iframe>
        </div>
        <div>
          <strong>Address:</strong> 1000 Heritage Center Circle, Round Rock, TX 78664<br />
          <strong>Email:</strong> <a href='mailto:info@atxconcretecontractor.com'>info@atxconcretecontractor.com</a>
        </div>
      </section>
    </>
  );
}