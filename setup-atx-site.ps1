# --- ATX Concrete Contractor Next.js Site Setup Script ---
# This script will overwrite all existing files with new content!

# Helper function to write file content
function Write-File($Path, $Content) {
    $dir = Split-Path $Path
    if (!(Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
    Set-Content -Path $Path -Value $Content -Force
}

# --- 1. Create global files ---

Write-File ".gitignore" @"
node_modules
.next
out
.env
.DS_Store
*.log
"@

Write-File "README.md" @"
# ATX Concrete Contractor

SEO-optimized website for a concrete contractor in Round Rock & Austin, TX.
"@

Write-File "package.json" @"
{
  "name": "atx-concrete-contractor",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint"
  },
  "dependencies": {
    "next": "14.2.3",
    "react": "18.2.0",
    "react-dom": "18.2.0"
  },
  "devDependencies": {
    "@types/node": "20.4.2",
    "@types/react": "18.2.14",
    "@types/react-dom": "18.2.7",
    "eslint": "8.56.0",
    "eslint-config-next": "14.2.3",
    "typescript": "5.4.5"
  }
}
"@

Write-File "tsconfig.json" @"
{
  "compilerOptions": {
    "target": "es5",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "forceConsistentCasingInFileNames": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "node",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "baseUrl": ".",
    "paths": {
      "@/*": ["src/*"]
    }
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx"],
  "exclude": ["node_modules"]
}
"@

Write-File "src/app/globals.css" @"
:root {
  --font-geist-sans: 'Geist', sans-serif;
  --font-geist-mono: 'Geist Mono', monospace;
  --primary: #f7b32b;
  --dark: #222;
  --light: #fff;
}

body {
  font-family: var(--font-geist-sans), Arial, sans-serif;
  background: #faf9f6;
  color: #222;
  margin: 0;
  padding: 0;
}

a {
  color: var(--primary);
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}
"@

   Write-File "src/app/favicon.ico" @" 
"@

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\setup-atx-site.ps1

# --- 2. Layout, Navbar, Footer, Hero ---

Write-File "src/app/layout.tsx" @"
import type { Metadata } from 'next';
import { Geist, Geist_Mono } from 'next/font/google';
import './globals.css';
import Navbar from '../components/Navbar';
import Footer from '../components/Footer';

const geistSans = Geist({
  variable: '--font-geist-sans',
  subsets: ['latin'],
});

const geistMono = Geist_Mono({
  variable: '--font-geist-mono',
  subsets: ['latin'],
});

export const metadata: Metadata = {
  title: 'ATX Concrete Contractor | Concrete Contractor in Austin & Round Rock, TX',
  description: 'Licensed & insured concrete contractor in Round Rock, TX. Driveways, patios, foundations, stamped concrete & more. Free estimates. Serving Austin, TX area.',
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang='en'>
      <body className={`${geistSans.variable} ${geistMono.variable}`}>
        <Navbar />
        <main>{children}</main>
        <Footer />
      </body>
    </html>
  );
}
"@

Write-File "src/components/Navbar.tsx" @"
'use client';
import Link from 'next/link';
import { useState } from 'react';
import styles from './Navbar.module.css';

const services = [
  { name: 'Driveways', path: '/services/driveways' },
  { name: 'Patios', path: '/services/patios' },
  { name: 'Foundations', path: '/services/foundations' },
  { name: 'Stamped Concrete', path: '/services/stamped-concrete' },
  { name: 'Sidewalks', path: '/services/sidewalks' },
];

export default function Navbar() {
  const [menuOpen, setMenuOpen] = useState(false);
  const [servicesOpen, setServicesOpen] = useState(false);

  return (
    <nav className={styles.navbar}>
      <div className={styles.logo}>
        <Link href='/'>ATX Concrete Contractor</Link>
      </div>
      <button
        className={styles.menuButton}
        onClick={() => setMenuOpen((open) => !open)}
        aria-label='Toggle menu'
      >
        ☰
      </button>
      <ul className={`${styles.navLinks} ${menuOpen ? styles.open : ''}`}>
        <li>
          <Link href='/'>Home</Link>
        </li>
        <li>
          <Link href='/about'>About</Link>
        </li>
        <li
          className={styles.dropdown}
          onMouseEnter={() => setServicesOpen(true)}
          onMouseLeave={() => setServicesOpen(false)}
        >
          <span>
            Services <span className={styles.caret}>▼</span>
          </span>
          <ul className={`${styles.dropdownMenu} ${servicesOpen ? styles.show : ''}`}>
            <li>
              <Link href='/services'>All Services</Link>
            </li>
            {services.map((service) => (
              <li key={service.path}>
                <Link href={service.path}>{service.name}</Link>
              </li>
            ))}
          </ul>
        </li>
        <li>
          <Link href='/projects'>Projects</Link>
        </li>
        <li>
          <Link href='/service-area'>Service Area</Link>
        </li>
        <li>
          <Link href='/contact'>Contact</Link>
        </li>
      </ul>
    </nav>
  );
}
"@

Write-File "src/components/Navbar.module.css" @"
.navbar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  background: #222;
  color: #fff;
  padding: 0.75rem 2rem;
  position: sticky;
  top: 0;
  z-index: 100;
}

.logo a {
  color: #fff;
  font-weight: bold;
  font-size: 1.25rem;
  text-decoration: none;
  letter-spacing: 1px;
}

.menuButton {
  display: none;
  background: none;
  border: none;
  color: #fff;
  font-size: 2rem;
  cursor: pointer;
}

.navLinks {
  display: flex;
  gap: 1.5rem;
  list-style: none;
  margin: 0;
  padding: 0;
}

.navLinks li a, .navLinks li span {
  color: #fff;
  text-decoration: none;
  font-size: 1rem;
  cursor: pointer;
  transition: color 0.2s;
}

.navLinks li a:hover, .navLinks li span:hover {
  color: #f7b32b;
}

.dropdown {
  position: relative;
}

.caret {
  font-size: 0.8em;
  margin-left: 0.2em;
}

.dropdownMenu {
  display: none;
  position: absolute;
  background: #333;
  top: 2.2rem;
  left: 0;
  min-width: 180px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.15);
  border-radius: 4px;
  z-index: 10;
}

.dropdownMenu li {
  padding: 0.5rem 1rem;
}

.dropdownMenu li a {
  color: #fff;
  display: block;
}

.dropdownMenu li a:hover {
  color: #f7b32b;
}

.dropdown:hover .dropdownMenu,
.show {
  display: block;
}

@media (max-width: 900px) {
  .navbar {
    flex-direction: column;
    align-items: flex-start;
    padding: 0.75rem 1rem;
  }
  .menuButton {
    display: block;
    margin-left: auto;
  }
  .navLinks {
    flex-direction: column;
    width: 100%;
    display: none;
    background: #222;
    margin-top: 0.5rem;
  }
  .navLinks.open {
    display: flex;
  }
  .navLinks li {
    margin: 0.5rem 0;
  }
  .dropdownMenu {
    position: static;
    box-shadow: none;
    min-width: 0;
    border-radius: 0;
  }
}
"@

Write-File "src/components/Footer.tsx" @"
import styles from './Footer.module.css';

export default function Footer() {
  return (
    <footer className={styles.footer}>
      <div>
        <strong>ATX Concrete Contractor</strong><br />
        1000 Heritage Center Circle, Round Rock, TX 78664<br />
        Phone: <a href='tel:5129919224'>(512) 991-9224</a>
      </div>
      <div>
        <a href='https://facebook.com/' target='_blank' rel='noopener noreferrer'>Facebook</a> |{' '}
        <a href='https://instagram.com/' target='_blank' rel='noopener noreferrer'>Instagram</a> |{' '}
        <a href='https://linkedin.com/' target='_blank' rel='noopener noreferrer'>LinkedIn</a>
      </div>
      <div>
        <small>
          &copy; {new Date().getFullYear()} ATX Concrete Contractor. All rights reserved.
        </small>
      </div>
    </footer>
  );
}
"@

Write-File "src/components/Footer.module.css" @"
.footer {
  background: #222;
  color: #fff;
  text-align: center;
  padding: 2rem 1rem 1rem 1rem;
  margin-top: 2rem;
  font-size: 1rem;
}

.footer a {
  color: #f7b32b;
  text-decoration: none;
  margin: 0 0.25rem;
}

.footer a:hover {
  text-decoration: underline;
}

.footer div {
  margin-bottom: 0.5rem;
}
"@

Write-File "src/components/Hero.tsx" @"
import styles from './Hero.module.css';
import Link from 'next/link';

export default function Hero() {
  return (
    <section className={styles.hero}>
      <div className={styles.content}>
        <h1>ATX Concrete Contractor</h1>
        <p>
          Concrete Driveways, Patios, Foundations & More<br />
          Serving Round Rock & Greater Austin, TX
        </p>
        <Link href='/contact' className={styles.cta}>
          Get a Free Estimate
        </Link>
      </div>
    </section>
  );
}
"@

Write-File "src/components/Hero.module.css" @"
.hero {
  background: linear-gradient(120deg, #f7b32b 0%, #222 100%);
  color: #fff;
  padding: 4rem 1rem 3rem 1rem;
  text-align: center;
  border-radius: 0 0 24px 24px;
  margin-bottom: 2rem;
}

.content {
  max-width: 600px;
  margin: 0 auto;
}

h1 {
  font-size: 2.5rem;
  margin-bottom: 1rem;
  font-weight: bold;
}

p {
  font-size: 1.25rem;
  margin-bottom: 2rem;
}

.cta {
  display: inline-block;
  background: #fff;
  color: #222;
  font-weight: bold;
  padding: 0.75rem 2rem;
  border-radius: 30px;
  text-decoration: none;
  font-size: 1.1rem;
  transition: background 0.2s, color 0.2s;
}

.cta:hover {
  background: #222;
  color: #f7b32b;
}
"@

# --- 3. Home, About, Services, Service Pages ---

Write-File "src/app/page.tsx" @"
import Hero from '../components/Hero';
import Head from 'next/head';

export default function Home() {
  return (
    <>
      <Head>
        <title>Concrete Contractor in Austin & Round Rock, TX | ATX Concrete Contractor</title>
        <meta
          name='description'
          content='Licensed & insured concrete contractor in Round Rock, TX. Driveways, patios, foundations, stamped concrete & more. Free estimates. Serving Austin, TX area.'
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
                  'name': 'What areas do you serve?',
                  'acceptedAnswer': {
                    '@type': 'Answer',
                    'text': 'We serve Round Rock, Austin, and surrounding areas in Central Texas.'
                  }
                },
                {
                  '@type': 'Question',
                  'name': 'Are you licensed and insured?',
                  'acceptedAnswer': {
                    '@type': 'Answer',
                    'text': 'Yes, ATX Concrete Contractor is fully licensed and insured for your peace of mind.'
                  }
                }
              ]
            })
          }}
        />
      </Head>
      <Hero />
      <section style={{ maxWidth: 800, margin: '2rem auto', padding: '0 1rem' }}>
        <h2>Concrete Contractor in Austin & Round Rock, TX</h2>
        <p>
          ATX Concrete Contractor is your trusted, licensed, and insured concrete expert serving Round Rock, Austin, and surrounding areas. We specialize in driveways, patios, foundations, stamped concrete, sidewalks, and more for both residential and commercial clients.
        </p>
        <ul>
          <li>Free estimates & local expertise</li>
          <li>High-quality materials & craftsmanship</li>
          <li>Serving Austin, Round Rock, Cedar Park, Pflugerville, Georgetown, and more</li>
        </ul>
        <h3>Our Services</h3>
        <ul>
          <li><a href='/services/driveways'>Concrete Driveways</a></li>
          <li><a href='/services/patios'>Concrete Patios</a></li>
          <li><a href='/services/foundations'>Foundations</a></li>
          <li><a href='/services/stamped-concrete'>Stamped Concrete</a></li>
          <li><a href='/services/sidewalks'>Sidewalks</a></li>
          <li><a href='/services'>All Services</a></li>
        </ul>
        <h3>Why Choose Us?</h3>
        <ul>
          <li>Decades of experience</li>
          <li>Licensed & insured</li>
          <li>Local, friendly, and professional</li>
          <li>Customer satisfaction guaranteed</li>
        </ul>
        <p>
          <a href='/contact' style={{ color: '#f7b32b', fontWeight: 'bold' }}>
            Contact us today for your free estimate!
          </a>
        </p>
      </section>
    </>
  );
}
"@

Write-File "src/app/about/page.tsx" @"
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
"@

Write-File "src/app/services/page.tsx" @"
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
"@

# --- Service Pages ---

# Driveways
Write-File "src/app/services/driveways/page.tsx" @"
import Head from 'next/head';

export default function Driveways() {
  return (
    <>
      <Head>
        <title>Concrete Driveways in Austin & Round Rock, TX | ATX Concrete Contractor</title>
        <meta
          name='description'
          content='Expert concrete driveway installation & repair in Austin & Round Rock, TX. Licensed, insured, free estimates. Call (512) 991-9224.'
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
                  'name': 'How long does a new concrete driveway last?',
                  'acceptedAnswer': {
                    '@type': 'Answer',
                    'text': 'A properly installed and maintained concrete driveway can last 25-30 years or more.'
                  }
                },
                {
                  '@type': 'Question',
                  'name': 'Do you offer free estimates for driveway projects?',
                  'acceptedAnswer': {
                    '@type': 'Answer',
                    'text': 'Yes! We provide free, no-obligation estimates for all concrete driveway installations and repairs.'
                  }
                }
              ]
            })
          }}
        />
      </Head>
      <section style={{ maxWidth: 800, margin: '2rem auto', padding: '0 1rem' }}>
        <h1>Concrete Driveways in Austin & Round Rock, TX</h1>
        <p>
          Upgrade your home's curb appeal and durability with a professionally installed concrete driveway from ATX Concrete Contractor. We serve Austin, Round Rock, and surrounding areas with expert driveway installation, replacement, and repair.
        </p>
        <h2>Benefits of a New Concrete Driveway</h2>
        <ul>
          <li>Long-lasting and low maintenance</li>
          <li>Boosts property value and curb appeal</li>
          <li>Custom finishes and decorative options available</li>
          <li>Resistant to Texas weather and heavy use</li>
        </ul>
        <h2>Our Driveway Installation Process</h2>
        <ol>
          <li>Free on-site estimate and consultation</li>
          <li>Site preparation and grading</li>
          <li>Professional concrete pouring and finishing</li>
          <li>Cleanup and final inspection</li>
        </ol>
        <h2>Frequently Asked Questions</h2>
        <h3>How long does a new concrete driveway last?</h3>
        <p>
          A properly installed and maintained concrete driveway can last 25-30 years or more.
        </p>
        <h3>Do you offer free estimates for driveway projects?</h3>
        <p>
          Yes! We provide free, no-obligation estimates for all concrete driveway installations and repairs.
        </p>
        <p>
          <a href='/contact' style={{ color: '#f7b32b', fontWeight: 'bold' }}>
            Ready for a new driveway? Contact us today!
          </a>
        </p>
        <p>
          <a href='/services'>← Back to All Services</a>
        </p>
      </section>
    </>
  );
}
"@

# --- Patios Service Page ---
Write-File "src/app/services/patios/page.tsx" @"
import Head from 'next/head';

export default function Patios() {
  return (
    <>
      <Head>
        <title>Concrete Patios in Austin & Round Rock, TX | ATX Concrete Contractor</title>
        <meta
          name='description'
          content='Custom concrete patio installation in Austin & Round Rock, TX. Licensed, insured, free estimates. Call (512) 991-9224.'
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
                  'name': 'What are the benefits of a concrete patio?',
                  'acceptedAnswer': {
                    '@type': 'Answer',
                    'text': 'Concrete patios are durable, low-maintenance, and can be customized with decorative finishes to match your style.'
                  }
                },
                {
                  '@type': 'Question',
                  'name': 'Can you add decorative finishes to patios?',
                  'acceptedAnswer': {
                    '@type': 'Answer',
                    'text': 'Yes! We offer stamped, stained, and colored concrete options for a custom look.'
                  }
                }
              ]
            })
          }}
        />
      </Head>
      <section style={{ maxWidth: 800, margin: '2rem auto', padding: '0 1rem' }}>
        <h1>Concrete Patios in Austin & Round Rock, TX</h1>
        <p>
          Transform your outdoor living space with a beautiful, long-lasting concrete patio from ATX Concrete Contractor. We design and build patios for homes and businesses in Austin, Round Rock, and nearby areas.
        </p>
        <h2>Benefits of a Concrete Patio</h2>
        <ul>
          <li>Durable and weather-resistant</li>
          <li>Low maintenance and easy to clean</li>
          <li>Custom shapes, sizes, and finishes</li>
          <li>Perfect for entertaining and relaxing outdoors</li>
        </ul>
        <h2>Our Patio Installation Process</h2>
        <ol>
          <li>Free consultation and design planning</li>
          <li>Site preparation and forming</li>
          <li>Concrete pouring and finishing</li>
          <li>Optional decorative stamping or staining</li>
          <li>Final walkthrough and cleanup</li>
        </ol>
        <h2>Frequently Asked Questions</h2>
        <h3>What are the benefits of a concrete patio?</h3>
        <p>
          Concrete patios are durable, low-maintenance, and can be customized with decorative finishes to match your style.
        </p>
        <h3>Can you add decorative finishes to patios?</h3>
        <p>
          Yes! We offer stamped, stained, and colored concrete options for a custom look.
        </p>
        <p>
          <a href='/contact' style={{ color: '#f7b32b', fontWeight: 'bold' }}>
            Ready for a new patio? Contact us today!
          </a>
        </p>
        <p>
          <a href='/services'>← Back to All Services</a>
        </p>
      </section>
    </>
  );
}
"@

# --- Foundations Service Page ---
Write-File "src/app/services/foundations/page.tsx" @"
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
"@

# --- Stamped Concrete Service Page ---
Write-File "src/app/services/stamped-concrete/page.tsx" @"
import Head from 'next/head';

export default function StampedConcrete() {
  return (
    <>
      <Head>
        <title>Stamped Concrete in Austin & Round Rock, TX | ATX Concrete Contractor</title>
        <meta
          name='description'
          content='Decorative stamped concrete patios, driveways, and walkways in Austin & Round Rock, TX. Licensed, insured, free estimates. Call (512) 991-9224.'
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
                  'name': 'What is stamped concrete?',
                  'acceptedAnswer': {
                    '@type': 'Answer',
                    'text': 'Stamped concrete is concrete that is patterned and/or textured to resemble brick, stone, tile, or other materials.'
                  }
                },
                {
                  '@type': 'Question',
                  'name': 'Where can stamped concrete be used?',
                  'acceptedAnswer': {
                    '@type': 'Answer',
                    'text': 'Stamped concrete is ideal for patios, driveways, walkways, and pool decks.'
                  }
                }
              ]
            })
          }}
        />
      </Head>
      <section style={{ maxWidth: 800, margin: '2rem auto', padding: '0 1rem' }}>
        <h1>Stamped Concrete in Austin & Round Rock, TX</h1>
        <p>
          Add beauty and value to your property with decorative stamped concrete from ATX Concrete Contractor. We offer a variety of patterns and colors for patios, driveways, walkways, and more.
        </p>
        <h2>Benefits of Stamped Concrete</h2>
        <ul>
          <li>Custom patterns and colors</li>
          <li>Durable and weather-resistant</li>
          <li>Affordable alternative to natural stone or pavers</li>
          <li>Low maintenance</li>
        </ul>
        <h2>Our Stamped Concrete Process</h2>
        <ol>
          <li>Design consultation and pattern selection</li>
          <li>Site prep and forming</li>
          <li>Concrete pour, coloring, and stamping</li>
          <li>Sealing and finishing</li>
        </ol>
        <h2>Frequently Asked Questions</h2>
        <h3>What is stamped concrete?</h3>
        <p>
          Stamped concrete is concrete that is patterned and/or textured to resemble brick, stone, tile, or other materials.
        </p>
        <h3>Where can stamped concrete be used?</h3>
        <p>
          Stamped concrete is ideal for patios, driveways, walkways, and pool decks.
        </p>
        <p>
          <a href='/contact' style={{ color: '#f7b32b', fontWeight: 'bold' }}>
            Interested in stamped concrete? Contact us today!
          </a>
        </p>
        <p>
          <a href='/services'>← Back to All Services</a>
        </p>
      </section>
    </>
  );
}
"@

# --- Sidewalks Service Page ---
Write-File "src/app/services/sidewalks/page.tsx" @"
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
"@

# --- Projects / Gallery Page ---
Write-File "src/app/projects/page.tsx" @"
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
"@

# --- GalleryGrid Component ---
Write-File "src/components/GalleryGrid.tsx" @"
import styles from './GalleryGrid.module.css';

const images = [
  '/images/project1.jpg',
  '/images/project2.jpg',
  '/images/project3.jpg',
  '/images/project4.jpg',
  '/images/project5.jpg',
  '/images/project6.jpg'
];

export default function GalleryGrid() {
  return (
    <div className={styles.grid}>
      {images.map((src, i) => (
        <div key={i} className={styles.item}>
          <img src={src} alt={'Project ' + (i + 1)} />
        </div>
      ))}
    </div>
  );
}
"@

Write-File "src/components/GalleryGrid.module.css" @"
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  gap: 1.5rem;
  margin: 2rem 0;
}
.item {
  background: #fff;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 2px 8px rgba(0,0,0,0.07);
  transition: transform 0.2s;
}
.item img {
  width: 100%;
  height: 180px;
  object-fit: cover;
  display: block;
}
.item:hover {
  transform: scale(1.03);
}
"@

# --- Contact Page ---
Write-File "src/app/contact/page.tsx" @"
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
"@

# --- ContactForm Component ---
Write-File "src/components/ContactForm.tsx" @"
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
          Don't fill this out: <input name='bot-field' />
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
"@

Write-File "src/components/ContactForm.module.css" @"
.form {
  background: #fff;
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.07);
  padding: 2rem;
  max-width: 600px;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  gap: 1rem;
}
.row {
  display: flex;
  gap: 1rem;
}
.row label {
  flex: 1;
}
label {
  font-weight: 500;
  margin-bottom: 0.5rem;
  display: flex;
  flex-direction: column;
}
input, textarea {
  border: 1px solid #ccc;
  border-radius: 6px;
  padding: 0.5rem;
  font-size: 1rem;
  margin-top: 0.25rem;
}
button {
  background: #f7b32b;
  color: #222;
  border: none;
  border-radius: 30px;
  padding: 0.75rem 2rem;
  font-weight: bold;
  font-size: 1.1rem;
  cursor: pointer;
  margin-top: 1rem;
  transition: background 0.2s, color 0.2s;
}
button:hover {
  background: #222;
  color: #f7b32b;
}
.hidden {
  display: none;
}
"@

# --- Service Area Page ---
Write-File "src/app/service-area/page.tsx" @"
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
"@