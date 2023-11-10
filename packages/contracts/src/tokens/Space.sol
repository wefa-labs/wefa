// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import { Ownable } from "openzeppelin-contracts/access/Ownable.sol";
import { ERC721 } from "openzeppelin-contracts/token/ERC721/ERC721.sol";
import { ERC721URIStorage } from "openzeppelin-contracts/token/ERC721/extensions/ERC721URIStorage.sol";

import {TBALib} from "../lib/TBA.sol";
import {SpaceAccount} from "../accounts/Space.sol";

error NotSpace();
error NotSpaceOwner();
error NFCNotRegistered();
error NotAuthorized();

contract SpaceToken is ERC721, Ownable {
    uint256 private _nextTokenId;
    address private _world;
    address private _spaceAccountImplementation;
    address private _nfcRegistry;
    address private _goodTransferResolver;

    constructor(
        address world,
        address spaceAccountImplementation,
        address nfcRegistry,
        address goodTransferResolver,
        string memory _name
    ) ERC721("WEFA Space", "SPACE") {
        _world = world;
        _spaceAccountImplementation = spaceAccountImplementation;
        _goodTransferResolver = goodTransferResolver;
        _nfcRegistry = nfcRegistry;
    }

    function mintSpace(
        address house,
        string memory nfcId,
        string memory name,
        string memory description,
        string memory image,
        uint style
    ) external {
        if (SpaceAccount(payable(house)).owner() != msg.sender) {
            revert NotSpaceOwner();
        }

        // if (NFCRegistry(_nfcRegistry).nfcIdToIssuer(nfcId) == address(0)) {
        //     revert NFCNotRegistered();
        // }

        uint256 tokenId = _nextTokenId++;
        _safeMint(house, tokenId);

        address spaceAccount = TBALib.createAccount(_spaceAccountImplementation, address(this), tokenId);

        // SpaceAccount(payable(spaceAccount)).initialize(nfcId);

        // SpaceTable(_spaceTable).insert(spaceAccount, house, nfcId, name, description, image, style);
    }

    function transferSpace(address oldSpace, address newSpace, uint256 tokenId) public {
        // require(SpaceAccount(payable(oldSpace)), NotSpace());
        // require(SpaceAccount(payable(newSpace)), NotSpace());

        if (msg.sender != _goodTransferResolver) {
            revert NotAuthorized();
        }

        transferFrom(oldSpace, newSpace, tokenId);
    }

    function _beforeTokenTransfer(
        address from, 
        address to, 
        uint256 tokenId,
        uint256 batchSize
    ) internal override virtual {
        // require(from == address(0), "Err: token transfer is BLOCKED");   
        super._beforeTokenTransfer(from, to, tokenId, batchSize);  
    }
}
