"use client";
import Link from "next/link";
import { useState } from "react";
import styles from "./Navbar.module.css";

const services = [
  { name: "Driveways", path: "/services/driveways" },
  { name: "Patios", path: "/services/patios" },
  { name: "Foundations", path: "/services/foundations" },
  { name: "Stamped Concrete", path: "/services/stamped-concrete" },
  { name: "Sidewalks", path: "/services/sidewalks" },
];

export default function Navbar() {
  const [menuOpen, setMenuOpen] = useState(false);
  const [servicesOpen, setServicesOpen] = useState(false);

  return (
    <nav className={styles.navbar}>
      <div className={styles.logo}>
        <Link href="/">ATX Concrete Contractor</Link>
      </div>
      <button
        className={styles.menuButton}
        onClick={() => setMenuOpen((open) => !open)}
        aria-label="Toggle menu"
      >
        ☰
      </button>
      <ul className={`${styles.navLinks} ${menuOpen ? styles.open : ""}`}>
        <li>
          <Link href="/">Home</Link>
        </li>
        <li>
          <Link href="/about">About</Link>
        </li>
        <li
          className={styles.dropdown}
          onMouseEnter={() => setServicesOpen(true)}
          onMouseLeave={() => setServicesOpen(false)}
        >
          <span>
            Services <span className={styles.caret}>▼</span>
          </span>
          <ul className={`${styles.dropdownMenu} ${servicesOpen ? styles.show : ""}`}>
            <li>
              <Link href="/services">All Services</Link>
            </li>
            {services.map((service) => (
              <li key={service.path}>
                <Link href={service.path}>{service.name}</Link>
              </li>
            ))}
          </ul>
        </li>
        <li>
          <Link href="/projects">Projects</Link>
        </li>
        <li>
          <Link href="/service-area">Service Area</Link>
        </li>
        <li>
          <Link href="/contact">Contact</Link>
        </li>
      </ul>
    </nav>
  );
}