// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import {Ownable} from "openzeppelin-contracts/access/Ownable.sol";
import {ERC721} from "openzeppelin-contracts/token/ERC721/ERC721.sol";

// import {NFCRegistry} from "./NFC.sol";
import {TBALib} from "../lib/TBA.sol";
import {KeeperAccount} from "../accounts/Keeper.sol";

error NotKeeper();
error NotKeeperOwner();
error NotKeeperOwner();
error NFCNotRegistered();

contract KeeperToken is ERC721, Ownable {
    uint256 private _nextTokenId;
    address private _holderAccountImplementation;
    address private _nfcRegistry;
    address private _goodTransferResolver;

    constructor(
        address holderAccountImplementation,
        address nfcRegistry,
        address goodTransferResolver,
        string memory _name
    ) ERC721(_name, "ART") {
        _holderAccountImplementation = holderAccountImplementation;
        _goodTransferResolver = goodTransferResolver;
        _nfcRegistry = nfcRegistry;
    }

    function registerKeeper(
        address house,
        string memory nfcId,
        string memory name,
        string memory description,
        string memory image,
        uint style
    ) external {
        if (KeeperAccount(house).owner() != msg.sender) {
            revert NotKeeperOwner();
        }

        // if (NFCRegistry(_nfcRegistry).nfcIdToIssuer(nfcId) == address(0)) {
        //     revert NFCNotRegistered();
        // }

        uint256 tokenId = _nextTokenId++;
        _safeMint(house, tokenId);

        address holderAccount = TBALib.createAccount(_holderAccountImplementation, address(this), tokenId);

        KeeperAccount(holderAccount).initialize(nfcId);

        KeeperTable(_holderTable).insert(holderAccount, house, nfcId, name, description, image, style);
    }

    function transferKeeper(address oldKeeper, address newKeeper, uint256 tokenId) public {
        require(KeeperAccount(oldKeeper), NotKeeper());
        require(KeeperAccount(newKeeper), NotKeeper());

        if (msg.sender != _goodTransferResolver) {
            revert NotAuthorized();
        }

        transferFrom(oldKeeper, newKeeper, tokenId);
    }
}
