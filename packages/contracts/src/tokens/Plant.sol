// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import {Ownable} from "openzeppelin-contracts/access/Ownable.sol";
import {ERC721} from "openzeppelin-contracts/token/ERC721/ERC721.sol";

// import {NFCRegistry} from "./NFC.sol";
import {TBALib} from "../lib/TBA.sol";
import {PlantAccount} from "../accounts/Plant.sol";

error NotPlant();
error NotPlantOwner();
error NotPlantOwner();
error NFCNotRegistered();

contract PlantToken is ERC721, Ownable {
    uint256 private _nextTokenId;
    address private _plantAccountImplementation;
    address private _nfcRegistry;
    address private _goodTransferResolver;

    constructor(
        address plantAccountImplementation,
        address nfcRegistry,
        address goodTransferResolver,
        string memory _name
    ) ERC721(_name, "ART") {
        _plantAccountImplementation = plantAccountImplementation;
        _goodTransferResolver = goodTransferResolver;
        _nfcRegistry = nfcRegistry;
    }

    function registerPlant(
        address house,
        string memory nfcId,
        string memory name,
        string memory description,
        string memory image,
        uint style
    ) external {
        if (PlantAccount(house).owner() != msg.sender) {
            revert NotPlantOwner();
        }

        // if (NFCRegistry(_nfcRegistry).nfcIdToIssuer(nfcId) == address(0)) {
        //     revert NFCNotRegistered();
        // }

        uint256 tokenId = _nextTokenId++;
        _safeMint(house, tokenId);

        address plantAccount = TBALib.createAccount(_plantAccountImplementation, address(this), tokenId);

        PlantAccount(plantAccount).initialize(nfcId);

        PlantTable(_plantTable).insert(plantAccount, house, nfcId, name, description, image, style);
    }

    function transferPlant(address oldPlant, address newPlant, uint256 tokenId) public {
        require(PlantAccount(oldPlant), NotPlant());
        require(PlantAccount(newPlant), NotPlant());

        if (msg.sender != _goodTransferResolver) {
            revert NotAuthorized();
        }

        transferFrom(oldPlant, newPlant, tokenId);
    }
}
