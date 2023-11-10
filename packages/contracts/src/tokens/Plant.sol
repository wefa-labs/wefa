// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import {Ownable} from "openzeppelin-contracts/access/Ownable.sol";
import {ERC721} from "openzeppelin-contracts/token/ERC721/ERC721.sol";
import { ERC721URIStorage } from "openzeppelin-contracts/token/ERC721/extensions/ERC721URIStorage.sol";

import {TBALib} from "../lib/TBA.sol";
import {NFCRegistry} from "../registries/NFC.sol";
import {PlantAccount} from "../accounts/Plant.sol";

error NotPlant();
error NotPlantOwner();
error NFCNotRegistered();
error NotAuthorized();

contract PlantToken is ERC721, Ownable {
    uint256 private _nextTokenId;
    address private _world;
    address private _plantAccountImplementation;
    address private _nfcRegistry;
    address private _goodTransferResolver;

    constructor(
        address world,
        address plantAccountImplementation,
        address nfcRegistry,
        address goodTransferResolver,
        string memory _name
    ) ERC721("WEFA Plant", "PLANT") {
        _world = world;
        _plantAccountImplementation = plantAccountImplementation;
        _goodTransferResolver = goodTransferResolver;
        _nfcRegistry = nfcRegistry;
    }

    function mintPlant(
        address house,
        string memory nfcId,
        string memory name,
        string memory description,
        string memory image,
        uint style
    ) external {
        if (PlantAccount(payable(house)).owner() != msg.sender) {
            revert NotPlantOwner();
        }

        // if (NFCRegistry(_nfcRegistry).nfcIdToIssuer(nfcId) == address(0)) {
        //     revert NFCNotRegistered();
        // }

        uint256 tokenId = _nextTokenId++;
        _safeMint(house, tokenId);

        address plantAccount = TBALib.createAccount(_plantAccountImplementation, address(this), tokenId);

        PlantAccount(payable(plantAccount)).initialize(nfcId);

        // PlantTable(_plantTable).insert(plantAccount, house, nfcId, name, description, image, style);
    }

    function transferPlant(address oldPlant, address newPlant, uint256 tokenId) public {
        // require(PlantAccount(oldPlant), NotPlant());
        // require(PlantAccount(newPlant), NotPlant());

        // if (msg.sender != _goodTransferResolver) {
        //     revert NotAuthorized();
        // }

        // transferFrom(oldPlant, newPlant, tokenId);
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
