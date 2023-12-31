// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { getUniqueEntity } from "@latticexyz/world-modules/src/modules/uniqueentity/getUniqueEntity.sol";

import { Owner } from "../codegen/tables/Owner.sol";
import { Asset, AssetData } from "../codegen/tables/Asset.sol";
import { Identity, IdentityData } from "../codegen/tables/Identity.sol";

import { TokenSystem } from "./TokenSystem.sol";

contract CreatureSystem is TokenSystem {
    function redeemCreature(string memory image, string memory meta, int32 longitude, int32 latitude, address spaceAddrs)
        public
    {
        // address userAddrs = _msgSender();
        // bytes32 player = addressToEntityKey(userAddrs);

        // bool isMember = ISpace(spaceAddrs).isMember(userAddrs);
        // require(isMember, "not member of space");

        // Check that proof is valid - Proof Verifies Zone, Plant, Image, Location, Health, Growth and Effect
        // require(verifyProof(plantId, spaceAddrs, longitude, latitude, commitment, proofData), "Invalid Proof");

        // Mint Creature TokenID - address will be entity id for creature
        // uint256 tokenId = mintCreature(msg.sender, meta);

        // Create Creature Entity
        // uint256 entity = world.getUniqueEntityId();

        // IdentityTable.set(player, IdentityTableData(meta, block.timestamp));
        // TokenIDTable.set(player, 0);
        // AssetTable.set(player, AssetTableData(image, ""));
        // HealthTable.set(player, HealthTableData(100, 100, HealthStatus.HEALTHY));
        // CareTable.set(player, CareTableData(block.timestamp, GrowthLevel.SEED));
        // EnergyTable.set(player, 1);
        // CoordinateTable.set(player, CoordinateTableData(longitude, latitude, 0));
        // OwnedByTable.set(player, msg.sender);
        // HomeTable.set(player, spaceAddrs);

        // return player;
    }

    function nurtureCreature(bytes32 _entity, int32 _energy) public {
        // address spaceAddrs = HomeTable.get(_entity);
        // bool isMember = ISpace(spaceAddrs).isMember(msg.sender);
        // require(isMember, "not space member");
        // require(OwnedByTable.get(_entity) == msg.sender, "not creature trainer");

        // bytes32 spaceId = addressToEntityKey(spaceAddrs);
        // int32 spaceEnergy = EnergyTable.get(spaceId);

        // require(spaceEnergy >= _energy, "not enough energy");

        // HealthTableData memory health = HealthTable.get(_entity);
        // CareTableData memory care = CareTable.get(_entity);
        // int32 healthNeeded = health.max - health.current;

        // require(healthNeeded > 0, "creature healthy");
        // require(health.status != HealthStatus.DEAD, "creature dead");
        // // require(care.checkedAt + 1 days < block.timestamp, "creature fed");

        // int32 energyCost = _energy;
        // int32 healthValue = _energy * 10;

        // if (healthValue > healthNeeded) {
        //     healthValue = healthNeeded;
        //     energyCost = healthNeeded / 10;
        // }

        // health.current = health.current + healthValue;
        // care.checkedAt = block.timestamp;

        // if (health.current > 69) {
        //     health.status = HealthStatus.HEALTHY;
        // } else if (health.current > 0) {
        //     health.status = HealthStatus.SICK;
        // } else {
        //     health.status = HealthStatus.DEAD;
        // }

        // EnergyTable.set(spaceId, spaceEnergy - energyCost);
        // HealthTable.set(_entity, health);
        // CareTable.set(_entity, care);

        // return abi.encode(healthValue, energyCost);
    }

    function evolveCreature(bytes32 _entity, string memory _image, string memory _meta) public {
        // address spaceAddrs = HomeTable.get(_entity);
        // bool isMember = ISpace(spaceAddrs).isMember(msg.sender);
        // require(isMember, "not space member");
        // require(OwnedByTable.get(_entity) == msg.sender, "not creature trainer");

        // HealthTableData memory health = HealthTable.get(_entity);
        // CareTableData memory care = CareTable.get(_entity);

        // require(health.status != HealthStatus.DEAD, "creature dead");
        // require(care.checkedAt + 1 days < block.timestamp, "creature fed");

        // int32 energyCost = 10;
        // int32 healthValue = 10;

        // health.current = health.current + healthValue;
        // care.checkedAt = block.timestamp;

        // if (health.current > 69) {
        //     health.status = HealthStatus.HEALTHY;
        // } else if (health.current > 0) {
        //     health.status = HealthStatus.SICK;
        // } else {
        //     health.status = HealthStatus.DEAD;
        // }

        // EnergyTable.set(spaceId, spaceEnergy - energyCost);
        // HealthTable.set(_entity, health);
        // CareTable.set(_entity, care);

        // return abi.encode(healthValue, energyCost);
    }
}
