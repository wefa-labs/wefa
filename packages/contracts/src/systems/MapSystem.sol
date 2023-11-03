// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { System } from "@latticexyz/world/src/System.sol";
// import { getUniqueEntity } from "@latticexyz/world/src/modules/uniqueentity/getUniqueEntity.sol";

// import { SizeEnum, StateEnum } from "../codegen/Types.sol";
// import { Map, MapData, Identity, IdentityData, Size, State, Owner, Space, SpaceData } from "../codegen/Tables.sol";

contract MapSystem is System {
  function createMap(
    string memory name,
    string memory description,
    string memory image
    // SizeEnum size
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

    function claimSpace(
    bytes32 worldId
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
