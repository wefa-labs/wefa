// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

/**
 * @title ISpaceSystem
 * @dev This interface is automatically generated from the corresponding system contract. Do not edit manually.
 */
interface ISpaceSystem {
  function createSpace() external returns (uint32);

  function joinSpace(uint32 spaceId, address keeper) external;

  function createMap() external returns (uint32);
}
