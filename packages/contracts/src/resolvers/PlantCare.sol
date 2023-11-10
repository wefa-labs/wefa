// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import {IEAS, Attestation} from "eas-contracts/IEAS.sol";
import {SchemaResolver} from "eas-contracts/resolver/SchemaResolver.sol";
import {Ownable} from "openzeppelin-contracts/access/Ownable.sol";

/// @title PlantCareResolver
/// @notice A schema resolver for the PlantCare event schema
contract PlantCareResolver is SchemaResolver, Ownable {
    enum PlantCareStatus {
        STARTED,
        APPROVED,
        COMPLETED,
        FAILED
    }

    struct PlantCareSchema {
        string nfcId; // DiD of the NFC
        address nfcIssuer; // Address of the NFC issuer
        address good; // ERC-6551 contract address
        PlantCareStatus status;
    }

    constructor(address easAddrs) SchemaResolver(IEAS(easAddrs)) {}

    function onAttest(Attestation calldata attestation, uint256 /*value*/ ) internal override returns (bool) {
        // require(attesters[attestation.attester], "PlantCarePlantCareCompleteResolver: not valid attester");

        PlantCareSchema memory schema = abi.decode(attestation.data, (PlantCareSchema));

        return true;
    }

    function onRevoke(Attestation calldata attestation, uint256 /*value*/ ) internal override returns (bool) {
        // require(attesters[attestation.attester], "PlantCareCompleteResolver: not valid attester");

        return true;
    }
}
