// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import { Ownable } from "openzeppelin-contracts/access/Ownable.sol";
import { ERC721 } from "openzeppelin-contracts/token/ERC721/ERC721.sol";
import { ERC721URIStorage } from "openzeppelin-contracts/token/ERC721/extensions/ERC721URIStorage.sol";

import { TBALib } from "../lib/TBA.sol";
import  {NFCRegistry } from "../registries/NFC.sol";
import { CreatureAccount } from "../accounts/Creature.sol";

import { IWorld } from "../codegen/world/IWorld.sol";

error NotCreature();
error NotCreatureOwner();
error NFCNotRegistered();
error NotAuthorized();

contract CreatureToken is ERC721, Ownable {
    uint256 private _nextTokenId;
    address private _world;
    address private _creatureAccountImplementation;
    address private _nfcRegistry;
    address private _goodTransferResolver;

    constructor(
        address world,
        address creatureAccountImplementation,
        address nfcRegistry,
        address goodTransferResolver,
        string memory _name
    ) ERC721("WEFA Creature", "CREATURE") {
        _world = world;
        _creatureAccountImplementation = creatureAccountImplementation;
        _goodTransferResolver = goodTransferResolver;
        _nfcRegistry = nfcRegistry;
    }

    function mintCreature(
        address house,
        string memory nfcId,
        string memory name,
        string memory description,
        string memory image,
        uint style
    ) external {
        if (CreatureAccount(payable(house)).owner() != msg.sender) {
            revert NotCreatureOwner();
        }

        // if (NFCRegistry(_nfcRegistry).nfcIdToIssuer(nfcId) == address(0)) {
        //     revert NFCNotRegistered();
        // }

        uint256 tokenId = _nextTokenId++;
        _safeMint(house, tokenId);

        address creatureAccount = TBALib.createAccount(_creatureAccountImplementation, address(this), tokenId);

        CreatureAccount(payable(creatureAccount)).initialize(nfcId);

        // CreatureTable(_creatureTable).insert(creatureAccount, house, nfcId, name, description, image, style);
    }

    function transferCreature(address oldCreature, address newCreature, uint256 tokenId) public {
        // require(CreatureAccount(oldCreature), NotCreature());
        // require(CreatureAccount(newCreature), NotCreature());

        // if (msg.sender != _goodTransferResolver) {
        //     revert NotAuthorized();
        // }

        // transferFrom(oldCreature, newCreature, tokenId);
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
