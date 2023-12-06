// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import { System } from "@latticexyz/world/src/System.sol";
import { getUniqueEntity } from "@latticexyz/world-modules/src/modules/uniqueentity/getUniqueEntity.sol";

import { Owner } from "../codegen/tables/Owner.sol";
import { Map, MapData } from "../codegen/tables/Map.sol";
import { Asset, AssetData } from "../codegen/tables/Asset.sol";
import { Identity, IdentityData } from "../codegen/tables/Identity.sol";

import { CellSystem } from "./CellSystem.sol";
import { GridSystem } from "./GridSystem.sol";

import { GamesLib } from "../lib/Games.sol";

contract GameMoveSystem is GridSystem, CellSystem {
  function claimPosition(
    bytes32 gameId,
    uint8 matchNumber,
    uint8 x
  ) public {
    require(x < 9, "position out of bounds");

    address user = _msgSender();

    // GameData memory gameData = Game.get(gameId);

    // Check some Game Conditiona
    // require(gameData.matchesPlayed == matchNumber, "match not found");
    // require(gameData.winner == address(0), "game won");

    // Check some  match conditions
    // MatchData memory matchData = Match.get(gameId, matchNumber);
    // require(matchData.winner == address(1), "match drawn");
    // require(matchData.winner == address(0), "match won");
    // require(matchData.currentPlayer == user, "not your turn");
    // require(matchData.board[x] == 7, "position already claimed");

    // Update match state
    // matchData.board[x] = uint8(Role.get(user, gameId));
    // matchData.turnCount += 1;

    // if (matchData.turnCount >= 5 && checkWin(matchData.board)) {
    //   matchData.winner = user;
    //   matchData.currentPlayer = address(0);
    //   gameData.matchesPlayed += 1;
    //   gameData.winner = user;
    // } else if (matchData.turnCount == 9) {
    //   matchData.currentPlayer = address(0);
    //   matchData.winner = address(1); // Set winner to 1 to indicate a draw
    //   gameData.matchesPlayed += 1;
    //   gameData.winner = address(1);
    // } else {
    //   matchData.currentPlayer = matchData.players[0] == user ? matchData.players[1] : matchData.players[0];      
    // }

    // RoleEnum role = Role.get(user, gameId);

    // IWorld(_world()).setCell(gameData.worldId, gameData.spaceId, 9 * matchNumber + x, bytes32(uint256(role)));

    // Match.set(gameId, matchNumber, matchData);
    // Game.set(gameId, gameData);
  }
}
