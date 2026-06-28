import styles from "./page.module.css";

export default function Home() {
  const backendUrl =
    process.env.NEXT_PUBLIC_MEDUSA_BACKEND_URL ?? "http://localhost:9000";

  return (
    <div className={styles.page}>
      <main className={styles.main}>
        <div className={styles.intro}>
          <h1>Medusa Storefront</h1>
          <p>
            This storefront is part of the monorepo and is configured to talk
            to the Medusa backend at:
          </p>
          <code>{backendUrl}</code>
        </div>
        <div className={styles.links}>
          <a
            className={styles.primary}
            href={`${backendUrl}/app`}
            target="_blank"
            rel="noopener noreferrer"
          >
            Open Medusa Admin
          </a>
          <a
            className={styles.secondary}
            href={backendUrl}
            target="_blank"
            rel="noopener noreferrer"
          >
            Open Backend API
          </a>
        </div>
      </main>
    </div>
  );
}
