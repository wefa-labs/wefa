import * as Sentry from "@sentry/react";

Sentry.init({
  dsn: "https://fd38e1523baa4f458456c6b4dc7658d5@o1400298.ingest.sentry.io/6729137",
  integrations: [
    new Sentry.BrowserTracing({
      // Set `tracePropagationTargets` to control for which URLs distributed tracing should be enabled
      tracePropagationTargets: [
        "localhost",
        /^https:\/\/wefa\.app\/api/,
        "https://wefa.app/",
        "https://dev.wefa.app",
      ],
    }),
    new Sentry.Replay(),
  ],

  // Set tracesSampleRate to 1.0 to capture 100%
  // of transactions for performance monitoring.
  // We recommend adjusting this value in production
  tracesSampleRate: 1.0,

  // Capture Replay for 10% of all sessions,
  // plus for 100% of sessions with an error
  replaysSessionSampleRate: 0.1,
  replaysOnErrorSampleRate: 1.0,
});
