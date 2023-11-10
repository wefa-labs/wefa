// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import { Script } from "forge-std/Script.sol";
import { console } from "forge-std/console.sol";
import { Create2 } from "openzeppelin-contracts/utils/Create2.sol";

import { TOKENBOUND_REGISTRY } from "../src/Constants.sol";
import { IWorld } from "../src/codegen/world/IWorld.sol";

import { NFCRegistry } from "../src/registries/NFC.sol";

import { SpaceToken } from "../src/tokens/Space.sol";
import { PlantToken } from "../src/tokens/Plant.sol";
import { KeeperToken } from "../src/tokens/Keeper.sol";
import { CreatureToken } from "../src/tokens/Creature.sol";

import { SpaceAccount } from "../src/accounts/Space.sol";
import { PlantAccount } from "../src/accounts/Plant.sol";
import { KeeperAccount } from "../src/accounts/Keeper.sol";
import { CreatureAccount } from "../src/accounts/Creature.sol";

import { PlantCareResolver } from "../src/resolvers/PlantCare.sol";
import { GoodTransferResolver } from "../src/resolvers/GoodTransfer.sol";

contract PostDeploy is Script {
  function run(address worldAddress) external {
    bytes32 salt = 0x655165516551655165516551655165516551655165516551655165516557;
    address factory = 0x4e59b44847b379578588920cA78FbF26c0B4956C;

    address wefaSafe = 0x3F35aC99149fD564f9a3f5eC78d146aeE1db7387;
    address erc4337EntryPoint = 0x5FF137D4b0FDCD49DcA30c7CF57E578a026d2789;
    address multicallForwarder = 0xcA1167915584462449EE5b4Ea51c37fE81eCDCCD;
      
    address guardian = Create2.computeAddress(
        salt,
        keccak256(abi.encodePacked(type(AccountGuardian).creationCode, abi.encode(wefaSafe))),
        factory
    );

    // address keeperImplementation = Create2.computeAddress(
    //     salt,
    //     keccak256(
    //         abi.encodePacked(
    //             type(KeeperAccount).creationCode,
    //             abi.encode(worldAddress , erc4337EntryPoint, multicallForwarder, TOKENBOUND_REGISTRY, guardian)
    //         )
    //     ),
    //     factory
    // );

    // address spaceImplementation = Create2.computeAddress(
    //     salt,
    //     keccak256(
    //         abi.encodePacked(
    //             type(SpaceAccount).creationCode,
    //             abi.encode(worldAddress, erc4337EntryPoint, multicallForwarder, TOKENBOUND_REGISTRY, guardian)
    //         )
    //     ),
    //     factory
    // );

    // address plantImplementation = Create2.computeAddress(
    //     salt,
    //     keccak256(
    //         abi.encodePacked(
    //             type(PlantAccount).creationCode,
    //             abi.encode(worldAddress , erc4337EntryPoint, multicallForwarder, TOKENBOUND_REGISTRY, guardian)
    //         )
    //     ),
    //     factory
    // );

    // address creatureImplementation = Create2.computeAddress(
    //     salt,
    //     keccak256(
    //         abi.encodePacked(
    //             type(CreatureAccount).creationCode,
    //             abi.encode(worldAddress, erc4337EntryPoint, multicallForwarder, TOKENBOUND_REGISTRY, guardian)
    //         )
    //     ),
    //     factory
    // );

    // address keeperProxy = Create2.computeAddress(
    //     salt,
    //     keccak256(abi.encodePacked(type(AccountProxy).creationCode, abi.encode(guardian, keeperImplementation))),
    //     factory
    // );

    // address spaceProxy = Create2.computeAddress(
    //     salt,
    //     keccak256(abi.encodePacked(type(AccountProxy).creationCode, abi.encode(guardian, spaceImplementation))),
    //     factory
    // );

    // address plantProxy = Create2.computeAddress(
    //     salt,
    //     keccak256(abi.encodePacked(type(AccountProxy).creationCode, abi.encode(guardian, plantImplementation))),
    //     factory
    // );

    // address creatureProxy = Create2.computeAddress(
    //     salt,
    //     keccak256(abi.encodePacked(type(AccountProxy).creationCode, abi.encode(guardian, creatureImplementation))),
    //     factory
    // );

    // address goodTransferResolver = Create2.computeAddress(
    //     salt,
    //     keccak256(abi.encodePacked(type(GoodTransferResolver).creationCode, abi.encode(EAS_OP))),
    //     factory
    // );

    // address plantCareResolver = Create2.computeAddress(
    //     salt,
    //     keccak256(abi.encodePacked(type(PlantCareResolver).creationCode, abi.encode(EAS_OP))),
    //     factory
    // );

    // address nfcRegistry = Create2.computeAddress(
    //     salt,
    //     keccak256(abi.encodePacked(type(NFCRegistry).creationCode, abi.encode())),
    //     factory
    // );

    // address keeperToken = Create2.computeAddress(
    //     salt,
    //     keccak256(
    //         abi.encodePacked(
    //             type(KeeperToken).creationCode, abi.encode(worldAddress, keeperImplementation, nfcRegistry)
    //         )
    //     ),
    //     factory
    // );

    // address spaceToken = Create2.computeAddress(
    //     salt,
    //     keccak256(abi.encodePacked(type(SpaceToken).creationCode, abi.encode(worldAddress, spaceImplementation))),
    //     factory
    // );

    // address plantToken = Create2.computeAddress(
    //     salt,
    //     keccak256(
    //         abi.encodePacked(
    //             type(PlantToken).creationCode, abi.encode(worldAddress, plantImplementation, nfcRegistry)
    //         )
    //     ),
    //     factory
    // );

    // address creatureToken = Create2.computeAddress(
    //     salt,
    //     keccak256(
    //         abi.encodePacked(
    //             type(CreatureToken).creationCode, abi.encode(worldAddress, creatureImplementation)
    //         )
    //     ),
    //     factory
    // );

    // Load the private key from the `PRIVATE_KEY` environment variable (in .env)
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

    // // Deploy AccountGuardian
    // if (guardian.code.length == 0) {
    //     vm.startBroadcast(deployerPrivateKey);
    //     new AccountGuardian{salt: salt}(wefaSafe);
    //     vm.stopBroadcast();

    //     console.log("AccountGuardian:", guardian, "(deployed)");
    // } else {
    //     console.log("AccountGuardian:", guardian, "(exists)");
    // }

    // // Deploy Keeper Account Implementation
    // if (keeperImplementation.code.length == 0) {
    //     vm.startBroadcast(deployerPrivateKey);
    //     new KeeperAccount{salt: salt}(
    //         erc4337EntryPoint,
    //         multicallForwarder,
    //         TOKENBOUND_REGISTRY,
    //         guardian
    //     );
    //     vm.stopBroadcast();

    //     console.log("KeeperAccount:", keeperImplementation, "(deployed)");
    // } else {
    //     console.log("KeeperAccount:", keeperImplementation, "(exists)");
    // }

    // // Deploy Space Account Implementation
    // if (spaceImplementation.code.length == 0) {
    //     vm.startBroadcast(deployerPrivateKey);
    //     new SpaceAccount{salt: salt}(
    //         erc4337EntryPoint,
    //         multicallForwarder,
    //         TOKENBOUND_REGISTRY,
    //         guardian
    //     );
    //     vm.stopBroadcast();

    //     console.log("SpaceAccount:", spaceImplementation, "(deployed)");
    // } else {
    //     console.log("SpaceAccount:", spaceImplementation, "(exists)");
    // }

    // // Deploy Plant Account Implementation
    // if (plantImplementation.code.length == 0) {
    //     vm.startBroadcast(deployerPrivateKey);
    //     new PlantAccount{salt: salt}(
    //         erc4337EntryPoint,
    //         multicallForwarder,
    //         TOKENBOUND_REGISTRY,
    //         guardian
    //     );
    //     vm.stopBroadcast();

    //     console.log("PlantAccount:", plantImplementation, "(deployed)");
    // } else {
    //     console.log("PlantAccount:", plantImplementation, "(exists)");
    // }

    // // Deploy Creature Account Implementation
    // if (creatureImplementation.code.length == 0) {
    //     vm.startBroadcast(deployerPrivateKey);
    //     new CreatureAccount{salt: salt}(
    //         erc4337EntryPoint,
    //         multicallForwarder,
    //         TOKENBOUND_REGISTRY,
    //         guardian
    //     );
    //     vm.stopBroadcast();

    //     console.log("CreatureAccount:", creatureImplementation, "(deployed)");
    // } else {
    //     console.log("CreatureAccount:", creatureImplementation, "(exists)");
    // }

    // // Deploy Keeper Account Proxy
    // if (keeperProxy.code.length == 0) {
    //     vm.stkeeperBroadcast(deployerPrivateKey);
    //     new KeeperAccount{salt: salt}(guardian, keeperImplementation);
    //     vm.stopBroadcast();

    //     console.log("KeeperAccount:", keeperProxy, "(deployed)");
    // } else {
    //     console.log("KeeperAccount:", keeperProxy, "(exists)");
    // }

    // // Deploy Space Account Proxy
    // if (spaceProxy.code.length == 0) {
    //     vm.startBroadcast(deployerPrivateKey);
    //     new SpaceAccount{salt: salt}(guardian, spaceImplementation);
    //     vm.stopBroadcast();

    //     console.log("SpaceAccount:", spaceProxy, "(deployed)");
    // } else {
    //     console.log("SpaceAccount:", spaceProxy, "(exists)");
    // }

    // // Deploy Plant Account Proxy
    // if (plantProxy.code.length == 0) {
    //     vm.stplantBroadcast(deployerPrivateKey);
    //     new PlantAccount{salt: salt}(guardian, plantImplementation);
    //     vm.stopBroadcast();

    //     console.log("PlantAccount:", plantProxy, "(deployed)");
    // } else {
    //     console.log("PlantAccount:", plantProxy, "(exists)");
    // }

    // // Deploy Creature Account Proxy
    // if (creatureProxy.code.length == 0) {
    //     vm.startBroadcast(deployerPrivateKey);
    //     new CreatureAccount{salt: salt}(guardian, creatureImplementation);
    //     vm.stopBroadcast();

    //     console.log("CreatureAccount:", creatureProxy, "(deployed)");
    // } else {
    //     console.log("CreatureAccount:", creatureProxy, "(exists)");
    // }

    // // Deploy Good Transfer Resolver
    // if (goodTransferResolver.code.length == 0) {
    //     vm.startBroadcast(deployerPrivateKey);
    //     new GoodTransferResolver{salt: salt}(EAS_OP);
    //     vm.stopBroadcast();

    //     console.log("GoodTransferResolver:", goodTransferResolver, "(deployed)");
    // } else {
    //     console.log("GoodTransferResolver:", goodTransferResolver, "(exists)");
    // }

    // // Deploy Plant Care Resolver
    // if (plantCareResolver.code.length == 0) {
    //     vm.startBroadcast(deployerPrivateKey);
    //     new GoodTransferResolver{salt: salt}(EAS_OP);
    //     vm.stopBroadcast();

    //     console.log("GoodTransferResolver:", plantCareResolver, "(deployed)");
    // } else {
    //     console.log("GoodTransferResolver:", plantCareResolver, "(exists)");
    // }

    // // Deploy NFC Registry
    // if (nfcRegistry.code.length == 0) {
    //     vm.startBroadcast(deployerPrivateKey);
    //     new NFCRegistry{salt: salt}();
    //     vm.stopBroadcast();

    //     console.log("NFCRegistry:", nfcRegistry, "(deployed)");
    // } else {
    //     console.log("NFCRegistry:", nfcRegistry, "(exists)");
    // }

    // // Deploy Keeper Token
    // if (keeperToken.code.length == 0) {
    //     vm.startBroadcast(deployerPrivateKey);
    //     new KeeperToken{salt: salt}( worldAddress, keeperImplementation );
    //     vm.stopBroadcast();

    //     console.log("KeeperToken:", keeperToken, "(deployed)");
    // } else {
    //     console.log("KeeperToken:", keeperToken, "(exists)");
    // }

    // // Deploy Space Token
    // if (spaceToken.code.length == 0) {
    //     vm.startBroadcast(deployerPrivateKey);
    //     new SpaceToken{salt: salt}( worldAddress, spaceImplementation );
    //     vm.stopBroadcast();

    //     console.log("SpaceToken:", spaceToken, "(deployed)");
    // } else {
    //     console.log("SpaceToken:", spaceToken, "(exists)");
    // }

    // // Deploy Plant Token
    // if (plantToken.code.length == 0) {
    //     vm.startBroadcast(deployerPrivateKey);
    //     new PlantToken{salt: salt}( 
    //        worldAddress,
    //        plantImplementation,
    //        plantCareResolver,
    //        goodTransferResolver,
    //        nfcRegistry
    //     );
    //     vm.stopBroadcast();

    //     console.log("PlantToken:", plantToken, "(deployed)");
    // } else {
    //     console.log("PlantToken:", plantToken, "(exists)");
    // }

    // // Deploy Creature Token
    // if (creatureToken.code.length == 0) {
    //     vm.startBroadcast(deployerPrivateKey);
    //     new CreatureToken{salt: salt}( worldAddress, creatureImplementation, goodTransferResolver);
    //     vm.stopBroadcast();

    //     console.log("CreatureToken:", creatureToken, "(deployed)");
    // } else {
    //     console.log("CreatureToken:", creatureToken, "(exists)");
    // }

    vm.startBroadcast(deployerPrivateKey);

    // Call increment on the world via the registered function selector
    uint32 newValue = IWorld(worldAddress).increment();
    console.log("Increment via IWorld:", newValue);

    IBaseWorld world = IBaseWorld(worldAddress);

    vm.stopBroadcast();
  }
}
