// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import { System } from "@latticexyz/world/src/System.sol";
import { getUniqueEntity } from "@latticexyz/world-modules/src/modules/uniqueentity/getUniqueEntity.sol";

import { GridTypeEnum, SizeEnum } from "../codegen/common.sol";

import { Owner } from "../codegen/tables/Owner.sol";
import { Map, MapData } from "../codegen/tables/Map.sol";
import { Grid, GridData } from "../codegen/tables/Grid.sol";

contract GridSystem is System {
  function claimGrid(
    bytes32 mapId,
    SizeEnum size
  ) public returns (bytes32) {
    address client = _msgSender();

    // require(Map.get(mapId).id == mapId, "world not found");
    // require(State.get(mapId) == StateEnum.Active, "world not active");
    // require(Grid.get(mapId, spaceId).id == spaceId, "space not found");
    // require(Owner.get(spaceId) == client, "not space owner");
    // require(State.get(spaceId) == StateEnum.Active, "space not active");

    // Owner.set(spaceId, to);
    
    return bytes32(0);
  }

  function setGrid(
    bytes32 gridId,
    GridTypeEnum gridType
  ) public {
    address client = _msgSender();

    // require(Map.get(mapId).id == mapId, "world not found");
    // require(State.get(mapId) == StateEnum.Active, "world not active");
    // require(Grid.get(mapId, spaceId).id == spaceId, "space not found");
    // require(Owner.get(spaceId) == client, "not space owner");
    // require(State.get(spaceId) == StateEnum.Active, "space not active");

    // GridData  memory space = Grid.get(mapId, spaceId);
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
  }
}
