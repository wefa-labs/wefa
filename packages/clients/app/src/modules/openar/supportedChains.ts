import {
  MUDChain,
  mudFoundry,
  latticeTestnet,
} from "@latticexyz/common/chains";
import { baseGoerli, optimismGoerli, polygonMumbai } from "@wagmi/chains";

// If you are deploying to chains other than anvil or Lattice testnet, add them here
export const supportedChains: MUDChain[] = import.meta.env.DEV
  ? [mudFoundry, optimismGoerli, baseGoerli, polygonMumbai, latticeTestnet]
  : [optimismGoerli, baseGoerli, polygonMumbai, latticeTestnet];
