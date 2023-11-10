// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import { System } from "@latticexyz/world/src/System.sol";
import { getUniqueEntity } from "@latticexyz/world-modules/src/modules/uniqueentity/getUniqueEntity.sol";

import { CellTypeEnum } from "../codegen/common.sol";
import { Grid, GridData, Cell, CellData, Owner } from "../codegen/index.sol";

import { PlantAccount } from "../accounts/Plant.sol";
import { KeeperAccount } from "../accounts/Keeper.sol";
import { CreatureAccount } from "../accounts/Creature.sol";

contract CellSystem is System {
  function createCell(
    bytes32 gridId,
    int32 position,
    CellTypeEnum cellType,
    address entity 
  ) external {
    GridData memory gridData = Grid.get(gridId);
    
    bytes32 cellId = getUniqueEntity();

    Owner.set(cellId, gridId);
    Cell.set(cellId, position, cellType, entity);
  }
  
  function setCell(
    bytes32 cellId,
    CellTypeEnum cellType,
    int32 position,
    address value
  ) public {
    address gridId = Owner.get(cellId);
    CellData memory cellData = Cell.get(cellId);
  }
}
