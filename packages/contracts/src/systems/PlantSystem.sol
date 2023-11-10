// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import {System} from "@latticexyz/world/src/System.sol";

import { TokenSystem } from "./TokenSystem.sol";

// import { getUniqueEntity } from "@latticexyz/world/src/modules/uniqueentity/getUniqueEntity.sol";

// Compoonents - Write

// import {HealthStatus, GrowthLevel} from "../codegen/Types.sol";
// import {ISpace} from "../interfaces/ISpace.sol";

contract PlantSystem is TokenSystem {
    function redeemPlant(
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

    function reportPlant() public {

    }

    function nurturePlant() public {

    }

    function _beforeProofSubmit(
        uint64, /* requestId */
        uint256[] memory inputs,
        ICircuitValidator validator
    ) internal view override {
        // check that  challenge input is address of sender
        address addr = GenesisUtils.int256ToAddress(
            inputs[validator.getChallengeInputIndex()]
        );
        // this is linking between msg.sender and
        require(
            _msgSender() == addr,
            "address in proof is not a sender address"
        );
    }

}
