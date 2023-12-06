// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import { AccountV3Upgradable } from "tokenbound/AccountV3Upgradable.sol";
import { Initializable } from "openzeppelin-contracts/proxy/utils/Initializable.sol";

import { AccountTypeEnum } from "../codegen/common.sol";

error NotKeeperOwner();

contract KeeperAccount is AccountV3Upgradable, Initializable {
  AccountTypeEnum constant ACCOUNT_TYPE = AccountTypeEnum.Keeper;
  address private _world;

  constructor(
    address world,
    address erc4337EntryPoint,
    address multicallForwarder,
    address erc6551Registry,
    address guardian
  ) AccountV3Upgradable(erc4337EntryPoint, multicallForwarder, erc6551Registry, guardian) {
    _world = world;
  }

  function initialize() external initializer {}

  function updateName(string memory name) external {
    if (_isValidSigner(msg.sender, "")) {
      revert NotKeeperOwner();
    }

    // KeeperTable(_houseTable).updateName(name);
  }

  function updateDescription(string memory description) external {
    if (_isValidSigner(msg.sender, "")) {
      revert NotKeeperOwner();
    }

    // KeeperTable(_houseTable).updateDescription(description);
  }

  function seedCreature(bytes32 creatureId) external {
    if (_isValidSigner(msg.sender, "")) {
      revert NotKeeperOwner();
    }

    // SpaceTable(_houseTable).updateImage(image);
  }

  function nurtureCreature(bytes32 creatureId) external {
    if (_isValidSigner(msg.sender, "")) {
      revert NotKeeperOwner();
    }

    // KeeperTable(_houseTable).updateImage(image);
  }

  function evolveCreature(bytes32 creatureId) external {
    if (_isValidSigner(msg.sender, "")) {
      revert NotKeeperOwner();
    }

    // KeeperTable(_houseTable).updateImage(image);
  }

  function startGame(address game) external {
    if (_isValidSigner(msg.sender, "")) {
      revert NotKeeperOwner();
    }

    // KeeperTable(_houseTable).updateImage(image);
  }

  function joinGame(address game) external {
    if (_isValidSigner(msg.sender, "")) {
      revert NotKeeperOwner();
    }

    // KeeperTable(_houseTable).updateImage(image);
  }

  function makeGameMove(address game) external {
    if (_isValidSigner(msg.sender, "")) {
      revert NotKeeperOwner();
    }

    // KeeperTable(_houseTable).updateImage(image);
  }
}
