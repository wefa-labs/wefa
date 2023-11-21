import { ErrorBoundary } from "@sentry/react";
import { ToastContainer } from "react-toastify";

import { AppProvider } from "./hooks/app/useApp";
import { WefaProvider } from "./hooks/wefa/useWefa";
import { SeedProvider } from "./hooks/wefa/useSeed";

import { Appbar } from "./components/Layout/AppBar";
import { Header } from "./components/Layout/Header";
// import { NotificationProvider } from "./components/Layout/Notifications";

import Views from "./views";

function App() {
  return (
    <ErrorBoundary fallback={<p>An error has occurred</p>}>
      <AppProvider>
        <WefaProvider>
          <SeedProvider>
            <Header />
            <Appbar />
            <Views />
            <ToastContainer
              bodyClassName=""
              // toastClassName="max-w-xs mx-auto text-neutral bg-primary rounded-xl py-2 px-3"
              progressClassName=""
              // hideProgressBar
              autoClose={3000}
              closeButton={false}
              limit={4}
            />
          </SeedProvider>
        </WefaProvider>
      </AppProvider>
    </ErrorBoundary>
  );
}

export default App;
