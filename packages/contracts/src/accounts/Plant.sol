// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import { AccountV3Upgradable } from "tokenbound/AccountV3Upgradable.sol";
import { Initializable } from "openzeppelin-contracts/proxy/utils/Initializable.sol";

import { EASLib } from "../lib/EAS.sol";

import { KeeperAccount } from "./Keeper.sol";
import { NFCRegistry } from "../registries/NFC.sol";
import { AccountTypeEnum } from "../codegen/common.sol";

error NotPlantOwner();
error TransferNotStarted();
error NotGoodTransferResolver();

contract PlantAccount is AccountV3Upgradable, Initializable {
    enum TransferStatus {
        None,
        Started,
        Approved
    }

    AccountTypeEnum constant ACCOUNT_TYPE = AccountTypeEnum.Plant;
    address private _world;
    address private _goodTransferResolver;
    address private _nfcRegistry;
    string public nfcId;

    address private _buyer;
    uint256 public transferStartedAt;
    TransferStatus public transferStatus;

    constructor(
        address world,
        address goodTransferResolver,
        address nfcRegistry,
        address erc4337EntryPoint,
        address multicallForwarder,
        address erc6551Registry,
        address guardian
    ) AccountV3Upgradable(erc4337EntryPoint, multicallForwarder, erc6551Registry, guardian) {
        _world = world;
        _goodTransferResolver = goodTransferResolver;
        _nfcRegistry = nfcRegistry;
    }

    function initialize(string memory _nfcId) external initializer {
        nfcId = _nfcId;
    }

    function startTransfer(address buyer) external {
        if (msg.sender != _goodTransferResolver) {
            revert NotGoodTransferResolver();
        }

        transferStatus = TransferStatus.Started;
        transferStartedAt = block.timestamp;
        _buyer = buyer;
    }

    function approveTransfer() external {
        if (_isValidSigner(msg.sender, "")) {
            revert NotPlantOwner();
        }

        if (transferStatus != TransferStatus.Started) {
            revert TransferNotStarted();
        }

        transferStatus = TransferStatus.Approved;
    }

    function completeTransfer() external {
        if (msg.sender != _goodTransferResolver) {
            revert NotGoodTransferResolver();
        }

        if (transferStatus != TransferStatus.Approved) {
            revert TransferNotStarted();
        }

        transferStatus = TransferStatus.None;
        transferStartedAt = 0;
        _buyer = address(0);

    }

    function cancelTransfer() external {
        if (_isValidSigner(msg.sender, "")) {
            revert NotPlantOwner();
        }

        if (transferStatus != TransferStatus.Started) {
            revert TransferNotStarted();
        }
    }

    function updateName(string memory name) external {
        if (_isValidSigner(msg.sender, "")) {
            revert NotPlantOwner();
        }

        // CreatureTable(_houseTable).updateName(name);
    }

    function updateMetadata(string memory metadata) external {
        if (_isValidSigner(msg.sender, "")) {
            revert NotPlantOwner();
        }

        // CreatureTable(_houseTable).updateDescription(description);
    }
}
