// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import {Ownable} from "openzeppelin-contracts/access/Ownable.sol";
import {ERC721} from "openzeppelin-contracts/token/ERC721/ERC721.sol";

import {NFCRegistry} from "./NFC.sol";
import {TBALib} from "../lib/TBA.sol";
import {SpaceAccount} from "../account/Space.sol";

error NotSpace();
error NotSpaceOwner();
error NotSpaceOwner();
error NFCNotRegistered();

contract SpaceRegistry is ERC721, Ownable {
    uint256 private _nextTokenId;
    address private _spaceAccountImplementation;
    address private _nfcRegistry;
    address private _goodTransferResolver;

    constructor(
        address spaceAccountImplementation,
        address nfcRegistry,
        address goodTransferResolver,
        string memory _name
    ) ERC721(_name, "ART") {
        _spaceAccountImplementation = spaceAccountImplementation;
        _goodTransferResolver = goodTransferResolver;
        _nfcRegistry = nfcRegistry;
    }

    function registerSpace(
        address house,
        string memory nfcId,
        string memory name,
        string memory description,
        string memory image,
        uint style
    ) external {
        if (SpaceAccount(house).owner() != msg.sender) {
            revert NotSpaceOwner();
        }

        if (NFCRegistry(_nfcRegistry).nfcIdToIssuer(nfcId) == address(0)) {
            revert NFCNotRegistered();
        }

        uint256 tokenId = _nextTokenId++;
        _safeMint(house, tokenId);

        address spaceAccount = TBALib.createAccount(_spaceAccountImplementation, address(this), tokenId);

        SpaceAccount(spaceAccount).initialize(nfcId);

        SpaceTable(_spaceTable).insert(spaceAccount, house, nfcId, name, description, image, style);
    }

    function transferSpace(address oldSpace, address newSpace, uint256 tokenId) public {
        require(SpaceAccount(oldSpace), NotSpace());
        require(SpaceAccount(newSpace), NotSpace());

        if (msg.sender != _goodTransferResolver) {
            revert NotAuthorized();
        }

        transferFrom(oldSpace, newSpace, tokenId);
    }
}
