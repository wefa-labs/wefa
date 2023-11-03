// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import {IEAS, Attestation} from "eas-contracts/IEAS.sol";
import {SchemaResolver} from "eas-contracts/resolver/SchemaResolver.sol";
import {Ownable} from "openzeppelin-contracts/access/Ownable.sol";

/// @title PlantTransferResolver
/// @notice A schema resolver for the PlantTransfer event schema
contract TransferResolver is SchemaResolver, Ownable {
    enum TransferStatus {
        STARTED,
        APPROVED,
        COMPLETED,
        FAILED
    }

    struct TransferSchema {
        string nfcId; // DiD of the NFC
        address nfcIssuer; // Address of the NFC issuer
        address good; // ERC-6551 contract address
        TransferStatus status;
    }

    constructor(address easAddrs) SchemaResolver(IEAS(easAddrs)) {}

    function onAttest(Attestation calldata attestation, uint256 /*value*/ ) internal override returns (bool) {
        // require(attesters[attestation.attester], "PlantTransferCompleteResolver: not valid attester");

        PlantTransferSchema memory schema = abi.decode(attestation.data, (PlantTransferSchema));

        return true;
    }

    function onRevoke(Attestation calldata attestation, uint256 /*value*/ ) internal override returns (bool) {
        // require(attesters[attestation.attester], "PlantTransferCompleteResolver: not valid attester");

        return true;
    }
}
