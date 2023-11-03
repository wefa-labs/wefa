// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import {IEAS, Attestation} from "eas-contracts/IEAS.sol";
import {SchemaResolver} from "eas-contracts/resolver/SchemaResolver.sol";
import {Ownable} from "openzeppelin-contracts/access/Ownable.sol";

/// @title PlantResolver
/// @notice A schema resolver for the Plant event schema
contract PlantResolver is SchemaResolver, Ownable {
    struct PlantSchema {
        string nfcId; // DiD of the NFC
        address nfcIssuer; // Address of the NFC issuer
        address good; // ERC-6551 contract address
        PlantStatus status;
    }

    constructor(address easAddrs) SchemaResolver(IEAS(easAddrs)) {}

    function onAttest(Attestation calldata attestation, uint256 /*value*/ ) internal override returns (bool) {
        // require(attesters[attestation.attester], "PlantPlantCompleteResolver: not valid attester");

        PlantPlantSchema memory schema = abi.decode(attestation.data, (PlantPlantSchema));

        return true;
    }

    function onRevoke(Attestation calldata attestation, uint256 /*value*/ ) internal override returns (bool) {
        // require(attesters[attestation.attester], "PlantPlantCompleteResolver: not valid attester");

        return true;
    }
}
