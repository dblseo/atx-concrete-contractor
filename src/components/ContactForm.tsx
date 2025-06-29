import styles from './ContactForm.module.css';

export default function ContactForm() {
  return (
    <form
      className={styles.form}
      name='contact'
      method='POST'
      data-netlify='true'
      netlify-honeypot='bot-field'
      style={{ margin: '2rem 0' }}
    >
      <input type='hidden' name='form-name' value='contact' />
      <p className={styles.hidden}>
        <label>
          Don’t fill this out: <input name='bot-field' />
        </label>
      </p>
      <div className={styles.row}>
        <label>
          Name
          <input type='text' name='name' required />
        </label>
        <label>
          Phone
          <input type='tel' name='phone' />
        </label>
      </div>
      <label>
        Email
        <input type='email' name='email' required />
      </label>
      <label>
        Message
        <textarea name='message' rows={5} required />
      </label>
      <button type='submit'>Send Message</button>
    </form>
  );
}