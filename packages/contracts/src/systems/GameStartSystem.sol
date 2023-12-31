// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import { System } from "@latticexyz/world/src/System.sol";
import { getUniqueEntity } from "@latticexyz/world-modules/src/modules/uniqueentity/getUniqueEntity.sol";

import { Owner } from "../codegen/tables/Owner.sol";
import { Token, TokenData } from "../codegen/tables/Token.sol";
import { Asset, AssetData } from "../codegen/tables/Asset.sol";
import { Identity, IdentityData } from "../codegen/tables/Identity.sol";

import { CellSystem } from "./CellSystem.sol";
import { GridSystem } from "./GridSystem.sol";

contract GameStartSystem is GridSystem, CellSystem {
  function createGame(
    // RoleEnum role,
    string memory name,
    bytes32 worldId,
    bytes32 spaceId
  ) public returns (bytes32) {
    address user = _msgSender();

    // require(Owner.get(spaceId) == user, "not owner of space");
    // require(ARWorld.get(worldId).spaceCount > 0, "no spaces found");

    // IWorld(_world()).transferSpace(worldId, spaceId, address(this));

    // bytes32 gameId = getUniqueEntity();

    address[] memory players = new address[](2);
    uint8[] memory board = new uint8[](9);
    players[0] = user;

    // Game.set(gameId, GameData({
    //     matchesPlayed: 0,
    //     worldId: worldId,
    //     spaceId: spaceId,
    //     winner: address(0),
    //     players: players
    // }));
    // Identity.set(gameId , IdentityData({
    //   name: name,
    //   description: "",
    //   image: ""
    // }));
    // Match.set(gameId, 0, MatchData({
    //   turnCount: 0,
    //   currentPlayer: address(0),
    //   winner: address(0),
    //   players: players,
    //   board: board
    // }));
    // Role.set(user, gameId, role);

    return bytes32(0);
  }

  function joinGame(
    bytes32 gameId
  ) public returns (bool) {
    address user = _msgSender();

    // GameData memory gameData = Game.get(gameId);

    // require(gameData.players.length <= 1, "game is full");
    // require(gameData.players[0] != user, "already in game");
    // require(gameData.matchesPlayed == 0, "game already started");
    // require(gameData.winner == address(0), "game already won");

    // MatchData memory matchData = Match.get(gameId, 0);

    // gameData.players[1] = user;

    // matchData.players[1] = user;
    // matchData.currentPlayer = matchData.players[uint8(block.timestamp) % 2]; // solhint-disable-line not-rely-on-time
    
    // RoleEnum opponentRole = Role.get(matchData.players[0], gameId);
    // RoleEnum role = opponentRole == RoleEnum.X ? RoleEnum.O : RoleEnum.X;

    // Role.set(user, gameId, role);
    // Match.set(gameId, 0, matchData);
    // Game.set(gameId, gameData);

    return true;
  }
}
