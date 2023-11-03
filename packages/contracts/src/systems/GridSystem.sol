// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import { System } from "@latticexyz/world/src/System.sol";
// import { getUniqueEntity } from "@latticexyz/world/src/modules/uniqueentity/getUniqueEntity.sol";

// import { StateEnum } from "../codegen/Types.sol";
// import { Map, Identity, IdentityData, State, Grid, Owner } from "../codegen/Tables.sol";

contract GridSystem is System {
  function transferGrid(
    bytes32 worldId,
    bytes32 spaceId,
    // address from,  // TODO: change from address to
    address to
  ) public returns (bytes32) {
    address client = _msgSender();

    // require(Map.get(worldId).id == worldId, "world not found");
    // require(State.get(worldId) == StateEnum.Active, "world not active");
    // require(Grid.get(worldId, spaceId).id == spaceId, "space not found");
    // require(Owner.get(spaceId) == client, "not space owner");
    // require(State.get(spaceId) == StateEnum.Active, "space not active");

    // Owner.set(spaceId, to);
    
    return spaceId;
  }

  function setGrid(
    bytes32 worldId,
    bytes32 spaceId,
    // StateEnum state,
    string memory name,
    string memory description,
    string memory image
  ) public returns (bytes32) {
    address client = _msgSender();

    // require(Map.get(worldId).id == worldId, "world not found");
    // require(State.get(worldId) == StateEnum.Active, "world not active");
    // require(Grid.get(worldId, spaceId).id == spaceId, "space not found");
    // require(Owner.get(spaceId) == client, "not space owner");
    // require(State.get(spaceId) == StateEnum.Active, "space not active");

    // GridData  memory space = Grid.get(worldId, spaceId);
    // IdentityData memory identity = Identity.get(spaceId);

    // if (bytes(name).length > 0) {
    //   identity.name = name;
    // }
    // if (bytes(description).length > 0) {
    //   identity.description = description;
    // }
    // if (bytes(image).length > 0) {
    //   identity.image = image;
    // }

    // State.set(spaceId, state);
    // Identity.set(spaceId, identity);

    return spaceId;
  }
}