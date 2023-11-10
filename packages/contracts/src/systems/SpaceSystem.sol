// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import { System } from "@latticexyz/world/src/System.sol";
import { Counter } from "../codegen/index.sol";

import { MapSystem } from "./MapSystem.sol";
import { TokenSystem } from "./TokenSystem.sol";

contract SpaceSystem is TokenSystem, MapSystem {
  function createSpace() public returns (uint32) {
    uint32 counter = Counter.get();
    uint32 newValue = counter + 1;
    Counter.set(newValue);
    return newValue;
  }

  function joinSpace(uint32 spaceId, address keeper) public {
    require(keeper != address(0), "SpaceSystem: keeper cannot be zero address");
    require(
      _spaces[spaceId].keepers[keeper] == false,
      "SpaceSystem: keeper already exists"
    );
    _spaces[spaceId].keepers[keeper] = true;
  }

  function createMap() public returns (uint32) {
    uint32 counter = Counter.get();
    uint32 newValue = counter + 1;
    Counter.set(newValue);
    return newValue;
  }
}
