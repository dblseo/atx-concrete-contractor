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