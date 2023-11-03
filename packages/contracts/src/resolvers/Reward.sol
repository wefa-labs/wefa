// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import {IEAS, Attestation} from "eas-contracts/IEAS.sol";
import {SchemaResolver} from "eas-contracts/resolver/SchemaResolver.sol";
import {Ownable} from "openzeppelin-contracts/access/Ownable.sol";

/// @title RewardResolver
/// @notice A schema resolver for the Reward event schema
contract RewardResolver is SchemaResolver, Ownable {
    struct RewardSchema {
        string nfcId; // DiD of the NFC
        address nfcIssuer; // Address of the NFC issuer
        address good; // ERC-6551 contract address
        TransferStatus status;
    }

    constructor(address easAddrs) SchemaResolver(IEAS(easAddrs)) {}

    function onAttest(Attestation calldata attestation, uint256 /*value*/ ) internal override returns (bool) {
        // require(attesters[attestation.attester], "RewardCompleteResolver: not valid attester");

        RewardSchema memory schema = abi.decode(attestation.data, (RewardSchema));

        return true;
    }

    function onRevoke(Attestation calldata attestation, uint256 /*value*/ ) internal override returns (bool) {
        // require(attesters[attestation.attester], "RewardCompleteResolver: not valid attester");

        return true;
    }
}
