// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import {Ownable} from "openzeppelin-contracts/access/Ownable.sol";
import {ERC721} from "openzeppelin-contracts/token/ERC721/ERC721.sol";

// import {NFCRegistry} from "./NFC.sol";
import {TBALib} from "../lib/TBA.sol";
import {CreatureAccount} from "../accounts/Creature.sol";

error NotCreature();
error NotCreatureOwner();
error NotCreatureOwner();
error NFCNotRegistered();

contract CreatureToken is ERC721, Ownable {
    uint256 private _nextTokenId;
    address private _creatureAccountImplementation;
    address private _nfcRegistry;
    address private _goodTransferResolver;

    constructor(
        address creatureAccountImplementation,
        address nfcRegistry,
        address goodTransferResolver,
        string memory _name
    ) ERC721(_name, "ART") {
        _creatureAccountImplementation = creatureAccountImplementation;
        _goodTransferResolver = goodTransferResolver;
        _nfcRegistry = nfcRegistry;
    }

    function registerCreature(
        address house,
        string memory nfcId,
        string memory name,
        string memory description,
        string memory image,
        uint style
    ) external {
        if (CreatureAccount(house).owner() != msg.sender) {
            revert NotCreatureOwner();
        }

        if (NFCRegistry(_nfcRegistry).nfcIdToIssuer(nfcId) == address(0)) {
            revert NFCNotRegistered();
        }

        uint256 tokenId = _nextTokenId++;
        _safeMint(house, tokenId);

        address creatureAccount = TBALib.createAccount(_creatureAccountImplementation, address(this), tokenId);

        CreatureAccount(creatureAccount).initialize(nfcId);

        CreatureTable(_creatureTable).insert(creatureAccount, house, nfcId, name, description, image, style);
    }

    function transferCreature(address oldCreature, address newCreature, uint256 tokenId) public {
        require(CreatureAccount(oldCreature), NotCreature());
        require(CreatureAccount(newCreature), NotCreature());

        if (msg.sender != _goodTransferResolver) {
            revert NotAuthorized();
        }

        transferFrom(oldCreature, newCreature, tokenId);
    }
}
