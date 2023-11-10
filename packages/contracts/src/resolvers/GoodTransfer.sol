// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import {IEAS, Attestation} from "eas-contracts/IEAS.sol";
import {SchemaResolver} from "eas-contracts/resolver/SchemaResolver.sol";
import {Ownable} from "openzeppelin-contracts/access/Ownable.sol";

/// @title GoodTransferResolver
/// @notice A schema resolver for the tGoodTransfer event schema
contract GoodTransferResolver is SchemaResolver, Ownable {
    enum GoodTransferStatus {
        STARTED,
        APPROVED,
        COMPLETED,
        FAILED
    }

    struct GoodTransferSchema {
        string nfcId; // DiD of the NFC
        address nfcIssuer; // Address of the NFC issuer
        address good; // ERC-6551 contract address
        GoodTransferStatus status;
    }

    constructor(address easAddrs) SchemaResolver(IEAS(easAddrs)) {}

    function onAttest(Attestation calldata attestation, uint256 /*value*/ ) internal override returns (bool) {
        // require(attesters[attestation.attester], "PlantGoodTransferCompleteResolver: not valid attester");

        GoodTransferSchema memory schema = abi.decode(attestation.data, (GoodTransferSchema));

        return true;
    }

    function onRevoke(Attestation calldata attestation, uint256 /*value*/ ) internal override returns (bool) {
        // require(attesters[attestation.attester], "PlantGoodTransferCompleteResolver: not valid attester");

        return true;
    }
}
