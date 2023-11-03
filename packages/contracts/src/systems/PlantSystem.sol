// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import {System} from "@latticexyz/world/src/System.sol";
// import { getUniqueEntity } from "@latticexyz/world/src/modules/uniqueentity/getUniqueEntity.sol";

// Compoonents - Write
// import {IdentityTable, IdentityTableData} from "../codegen/tables/IdentityTable.sol";
// import {TokenIDTable} from "../codegen/tables/TokenIDTable.sol";
// import {AssetTable, AssetTableData} from "../codegen/tables/AssetTable.sol";
// import {HealthTable, HealthTableData} from "../codegen/tables/HealthTable.sol";
// import {CareTable, CareTableData} from "../codegen/tables/CareTable.sol";
// import {CoordinateTable, CoordinateTableData} from "../codegen/tables/CoordinateTable.sol";
// import {ElementTable} from "../codegen/tables/ElementTable.sol";
// import {OwnedByTable} from "../codegen/tables/OwnedByTable.sol";
// import {HomeTable} from "../codegen/tables/HomeTable.sol";

// import {HealthStatus, GrowthLevel} from "../codegen/Types.sol";
// import {addressToEntityKey} from "../addressToEntityKey.sol";
// import {ISpace} from "../interfaces/ISpace.sol";

contract PlantSystem is System {
    function redeem(
        string memory image,
        string memory meta,
        int32 long,
        int32 lat,
        // HealthStatus healthStatus,
        // GrowthLevel growthLevel,
        address userAddrs
    ) public returns (bytes32) {
        // require(healthStatus != HealthStatus.DEAD, "plant is dead");
        address spaceAddrs = _msgSender();
        // bytes32 player = addressToEntityKey(userAddrs);

        // bool isMember = ISpace(spaceAddrs).isMember(userAddrs);
        // require(isMember, "not member of space");

        // check that proof is valid - Proof Verifies Zone, Plant, Image, Location, Health, Growth and Season

        // Mint Plant Token with that system.
        // uint256 tokenId = mintPlant(sender, meta);

        // IdentityTable.set(player, IdentityTableData(meta, block.timestamp));
        // TokenIDTable.set(player, 0);
        // AssetTable.set(player, AssetTableData(image, ""));
        // HealthTable.set(player, HealthTableData(100, 100, healthStatus));
        // CareTable.set(player, CareTableData(block.timestamp, growthLevel));
        // CoordinateTable.set(player, CoordinateTableData(long, lat, 0));
        // OwnedByTable.set(player, userAddrs);
        // HomeTable.set(player, msg.sender);

        return bytes32(0);
    }
}
