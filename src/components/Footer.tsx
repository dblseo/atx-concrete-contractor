import styles from "./Footer.module.css";

export default function Footer() {
  return (
    <footer className={styles.footer}>
      <div>
        <strong>ATX Concrete Contractor</strong><br />
        1000 Heritage Center Circle, Round Rock, TX 78664<br />
        Phone: <a href="tel:5129919224">(512) 991-9224</a>
      </div>
      <div>
        <a href="https://facebook.com/" target="_blank" rel="noopener noreferrer">Facebook</a> |{" "}
        <a href="https://instagram.com/" target="_blank" rel="noopener noreferrer">Instagram</a> |{" "}
        <a href="https://linkedin.com/" target="_blank" rel="noopener noreferrer">LinkedIn</a>
      </div>
      <div>
        <small>
          &copy; {new Date().getFullYear()} ATX Concrete Contractor. All rights reserved.
        </small>
      </div>
    </footer>
  );
}