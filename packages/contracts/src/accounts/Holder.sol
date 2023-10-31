// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import {AccountV3} from "tokenbound/AccountV3.sol";

error NotHolderOwner();

contract HolderAccount is AccountV3 {
    constructor(
        address erc4337EntryPoint,
        address multicallForwarder,
        address erc6551Registry,
        address guardian
    ) AccountV3(erc4337EntryPoint, multicallForwarder, erc6551Registry, guardian) {
    }

    function updateName(string memory name) external returns () {
        if (_isValidSigner(msg.sender) == false) {
            revert NotHolderOwner();
        }

        HolderTable(_houseTable).updateName(name);
    }

    function updateDescription(string memory description) external returns () {
        if (_isValidSigner(msg.sender) == false) {
            revert NotHolderOwner();
        }

        HolderTable(_houseTable).updateDescription(description);
    }

    function updateStyle(uint style) external returns () {
        if (_isValidSigner(msg.sender) == false) {
            revert NotHolderOwner();
        }

        HolderTable(_houseTable).updateStyle(style);
    }

    function updateImage(string memory image) external returns () {
        if (_isValidSigner(msg.sender) == false) {
            revert NotHolderOwner();
        }

        HolderTable(_houseTable).updateImage(image);
    }
}