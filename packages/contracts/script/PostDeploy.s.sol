// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import { Script } from "forge-std/Script.sol";
import { console } from "forge-std/console.sol";
import { Create2 } from "openzeppelin-contracts/utils/Create2.sol";

import { IWorld } from "../src/codegen/world/IWorld.sol";
import { TOKENBOUND_REGISTRY } from "../src/Constants.sol";

import { KeeperToken } from "../src/tokens/Keeper.sol";
import { CreatureToken } from "../src/tokens/Creature.sol";

import { KeeperAccount } from "../src/accounts/Keeper.sol";
import { CreatureAccount } from "../src/accounts/Creature.sol";

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

    // address creatureProxy = Create2.computeAddress(
    //     salt,
    //     keccak256(abi.encodePacked(type(AccountProxy).creationCode, abi.encode(guardian, creatureImplementation))),
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

    // // Deploy Creature Account Proxy
    // if (creatureProxy.code.length == 0) {
    //     vm.startBroadcast(deployerPrivateKey);
    //     new CreatureAccount{salt: salt}(guardian, creatureImplementation);
    //     vm.stopBroadcast();

    //     console.log("CreatureAccount:", creatureProxy, "(deployed)");
    // } else {
    //     console.log("CreatureAccount:", creatureProxy, "(exists)");
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
