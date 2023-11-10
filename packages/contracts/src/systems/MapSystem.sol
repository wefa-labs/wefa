// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import { System } from "@latticexyz/world/src/System.sol";

import { MapTypeEnum, SizeEnum } from "../codegen/common.sol";

import { Owner } from "../codegen/tables/Owner.sol";
import { Map, MapData } from "../codegen/tables/Map.sol";
import { Asset, AssetData } from "../codegen/tables/Asset.sol";
import { Identity, IdentityData } from "../codegen/tables/Identity.sol";

import { GridSystem } from "./GridSystem.sol";

contract MapSystem is GridSystem {
  function createMap(
    bytes32 spaceId,
    string memory metadata,
    string memory image,
    SizeEnum size,
    MapTypeEnum mapType
  ) public returns (bytes32) {
    address owner = _msgSender();
    // bytes32 worldId = getUniqueEntity();

    // Identity.set(worldId, IdentityData({
    //   name: name,
    //   description: description,
    //   image: image
    // }));
    // Map.set(worldId, MapData({
    //   id: worldId,
    //   spaceCount: 0
    // }));    
    // Owner.set(worldId, owner);
    // Size.set(worldId, SizeEnum.Mini);
    // State.set(worldId, StateEnum.Active);

    return bytes32(0);
  }

    function claimGrid(
    bytes32 mapId
  ) public returns (bytes32) {
    address client = _msgSender();

    // require(Map.get(worldId).id == worldId, "world not found");
    // require(State.get(worldId) == StateEnum.Active, "world not active");
    
    // SizeEnum size = Size.get(worldId);
    // uint32 spaceCount = Map.get(worldId).spaceCount;
   
    // if (size == SizeEnum.Mini) {
    //   require(spaceCount <= 4, "mini world full");
    // } else if (size == SizeEnum.Small) {
    //   require(spaceCount <= 9, "sm world full");
    // } else if (size == SizeEnum.Medium) {
    //   require(spaceCount <= 81, "md world full");
    // } else if (size == SizeEnum.Large) {
    //   require(spaceCount <= 729, "lg world full");
    // } else {
    //   revert("invalid space size");
    // }

    // bytes32 spaceId = getUniqueEntity();

    // Space.set(worldId, spaceId, SpaceData({
    //   id: spaceId,
    //   position: spaceCount
    // }));
    // State.set(spaceId, StateEnum.Active);
    // Owner.set(spaceId, client);
    // Map.set(worldId, MapData({
    //   id: worldId,
    //   spaceCount: spaceCount + 1
    // }));
 
    return bytes32(0);
  }
}
