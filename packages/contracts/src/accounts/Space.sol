// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import { AccountV3Upgradable } from "tokenbound/AccountV3Upgradable.sol";
import { Initializable } from "openzeppelin-contracts/proxy/utils/Initializable.sol";

import { KeeperAccount } from "./Keeper.sol";
import { AccountTypeEnum } from "../codegen/common.sol";

error NotSpaceOwner();

contract SpaceAccount is AccountV3Upgradable, Initializable {
    AccountTypeEnum constant ACCOUNT_TYPE = AccountTypeEnum.Space;
    address private _world;

    constructor(
        address world,
        address erc4337EntryPoint,
        address multicallForwarder,
        address erc6551Registry,
        address guardian
    ) AccountV3Upgradable(erc4337EntryPoint, multicallForwarder, erc6551Registry, guardian) {
        _world = world;
    }

    function initialize() external initializer {
    }

    function updateName(string memory name) external {
        if (_isValidSigner(msg.sender, "")) {
            revert NotSpaceOwner();
        }

        // SpaceTable(_houseTable).updateName(name);
    }

    function updateDescription(string memory description) external {
        if (_isValidSigner(msg.sender, "")) {
            revert NotSpaceOwner();
        }

        // SpaceTable(_houseTable).updateDescription(description);
    }

    function updateImage(string memory image) external {
        if (_isValidSigner(msg.sender, "")) {
            revert NotSpaceOwner();
        }

        // SpaceTable(_houseTable).updateImage(image);
    }

    function inviteKeepers(address[] memory keeper) external {
        if (_isValidSigner(msg.sender, "")) {
            revert NotSpaceOwner();
        }

        // SpaceTable(_houseTable).addKeeper(keeper);
    }

    function joinSpace(address keeper) external {
        if (_isValidSigner(msg.sender, "")) {
            revert NotSpaceOwner();
        }

        // SpaceTable(_houseTable).addKeeper(keeper);
    }
}
