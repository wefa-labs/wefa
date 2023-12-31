// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import { System } from "@latticexyz/world/src/System.sol";

import { Owner } from "../codegen/tables/Owner.sol";
import { Token, TokenData } from "../codegen/tables/Token.sol";
import { Asset, AssetData } from "../codegen/tables/Asset.sol";

import { TokenSystem } from "./TokenSystem.sol";

contract GameCollectibleSystem is TokenSystem {
  function claimTrophy(
    bytes32 matchId
  ) public returns (string memory meta) {
    address user = _msgSender();
    
    // TODO: Check if already minted using the match ID as the token ID

    // MatchData memory matchData = Match.get(matchId, 0);

    // require(matchData.players[0] != user, "already in game");
    // require(matchData.players[1] == address(0), "game is full");
    
    // matchData.players[1] = user;
    
    // Match.set(matchId, 0, matchData);

    // TODO: Mint NFT
    // Randomly pick between Tic, Tac, and Toe as  the token URI

    return "metadata";
  }
}
