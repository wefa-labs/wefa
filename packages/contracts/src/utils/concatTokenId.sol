// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "./addressToEntityKey.sol";

function concatTokenID(address addr, uint256 tokenId) pure returns (bytes32) {
  return keccak256(abi.encodePacked(addressToEntityKey(addr), tokenId));
}
