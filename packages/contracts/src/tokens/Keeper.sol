// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import {Ownable} from "openzeppelin-contracts/access/Ownable.sol";
import {ERC721} from "openzeppelin-contracts/token/ERC721/ERC721.sol";
import { ERC721URIStorage } from "openzeppelin-contracts/token/ERC721/extensions/ERC721URIStorage.sol";

import {TBALib} from "../lib/TBA.sol";
import {KeeperAccount} from "../accounts/Keeper.sol";

error NotKeeper();
error NotKeeperOwner();
error NFCNotRegistered();
error NotAuthorized();

contract KeeperToken is ERC721, Ownable {
    uint256 private _nextTokenId;
    address private _world;
    address private _keeperAccountImplementation;
    address private _nfcRegistry;
    address private _goodTransferResolver;

    constructor(
        address world,
        address keeperAccountImplementation,
        address nfcRegistry,
        address goodTransferResolver,
        string memory _name
    ) ERC721("WEFA Keeper", "KEEPER") {
        _world = world;
        _keeperAccountImplementation = keeperAccountImplementation;
        _goodTransferResolver = goodTransferResolver;
        _nfcRegistry = nfcRegistry;
    }

    function mintKeeper(
        address house,
        string memory nfcId,
        string memory name,
        string memory description,
        string memory image,
        uint style
    ) external {
        if (KeeperAccount(payable(house)).owner() != msg.sender) {
            revert NotKeeperOwner();
        }

        // if (NFCRegistry(_nfcRegistry).nfcIdToIssuer(nfcId) == address(0)) {
        //     revert NFCNotRegistered();
        // }

        uint256 tokenId = _nextTokenId++;
        _safeMint(house, tokenId);

        address keeperAccount = TBALib.createAccount(_keeperAccountImplementation, address(this), tokenId);

        // KeeperTable(_keeperTable).insert(keeperAccount, house, nfcId, name, description, image, style);
    }

    function _beforeTokenTransfer(
        address from, 
        address to, 
        uint256 tokenId,
        uint256 batchSize
    ) internal override virtual {
        require(from == address(0), "Err: token transfer is BLOCKED");   
        super._beforeTokenTransfer(from, to, tokenId, batchSize);  
    }
}
