// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

import {System} from "@latticexyz/world/src/System.sol";

import {poseidon2Bytecode, poseidon3Bytecode} from "../bytecode.sol";

interface Poseidon2Contract {
    function poseidon(uint256[2] memory inputs) external returns (uint256);
}

interface Poseidon3Contract {
    function poseidon(uint256[3] memory inputs) external returns (uint256);
}

contract PoseidonSystem is System {
    Poseidon2Contract poseidon2Contract;
    Poseidon3Contract poseidon3Contract;

    function deployBytecode(bytes memory bytecode) public returns (address pointer) {
        assembly {
            pointer := create(0, add(bytecode, 32), mload(bytecode))
        }
    }

    function poseidon2(uint256 a, uint256 b) public returns (uint256) {
        return poseidon2Contract.poseidon([a, b]);
    }

    function poseidon3(uint256 a, uint256 b, uint256 c) public returns (uint256) {
        return poseidon3Contract.poseidon([a, b, c]);
    }

    function poseidonChainRoot(uint256[] memory values) public returns (uint256) {
        uint256 result = values[0];
        for (uint256 i = 1; i < values.length; ++i) {
            result = poseidon2(result, values[i]);
        }
        return result;
    }

    function coordsPoseidonChainRoot(uint16[] memory xValues, uint16[] memory yValues) public returns (uint256) {
        uint256 result = poseidon2(xValues[0], xValues[1]);
        for (uint256 i = 2; i < 2 * xValues.length; ++i) {
            if (i < xValues.length) result = poseidon2(result, xValues[i]);
            else result = poseidon2(result, yValues[i - xValues.length]);
        }
        return result;
    }
}
