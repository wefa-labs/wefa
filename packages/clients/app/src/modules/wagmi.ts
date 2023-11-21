import {
  baseGoerli,
  optimismGoerli,
  polygonMumbai,
  foundry,
} from "wagmi/chains";
import { createConfig, configureChains } from "wagmi";
import { jsonRpcProvider } from "wagmi/providers/jsonRpc";
import { alchemyProvider } from "wagmi/providers/alchemy";
// import { getDefaultWallets } from "@rainbow-me/rainbowkit";

export const chainConfig = configureChains(
  [baseGoerli, optimismGoerli, polygonMumbai, foundry],
  [
    alchemyProvider({ apiKey: import.meta.env.VITE_ALCHEMY_API_KEY! }),
    jsonRpcProvider({
      rpc: (chain) => {
        if (chain.id === foundry.id) {
          return { http: "http://localhost:8545" };
        }
        return { http: chain.rpcUrls.default.http[0] };
      },
    }),
  ]
);

export const config = createConfig({
  autoConnect: true,
  publicClient: chainConfig.publicClient,
  webSocketPublicClient: chainConfig.webSocketPublicClient,
});
