import "./index.css";
import "./modules/sentry";
import "react-toastify/dist/ReactToastify.css";
import "react-spring-bottom-sheet/dist/style.css";

import React from "react";
import ReactDOM from "react-dom/client";

import { WagmiConfig } from "wagmi";
import { BrowserRouter } from "react-router-dom";
// import { mount as mountDevTools } from "@latticexyz/dev-tools";

import { PrivyProvider } from "@privy-io/react-auth";
import { PrivyWagmiConnector } from "@privy-io/wagmi-connector";

import { setup } from "./modules/openar/setup";
import { config, chainConfig } from "./modules/wagmi";

import { MUDProvider } from "./hooks/useMud";

import App from "./App";

const rootElement = document.getElementById("react-root");
if (!rootElement) throw new Error("React root not found");
const root = ReactDOM.createRoot(rootElement);

setup().then((result) => {
  root.render(
    <React.StrictMode>
      <MUDProvider value={result}>
        <WagmiConfig config={config}>
          <PrivyProvider
            appId={import.meta.env.VITE_PRIVY_APP_ID ?? ""}
            config={{
              loginMethods: ["email", "wallet"],
              appearance: {
                theme: "light",
              },
            }}
          >
            <PrivyWagmiConnector wagmiChainsConfig={chainConfig}>
              <BrowserRouter>
                <App />
              </BrowserRouter>
            </PrivyWagmiConnector>
          </PrivyProvider>
        </WagmiConfig>
      </MUDProvider>
    </React.StrictMode>
  );
  // mountDevTools();
});
