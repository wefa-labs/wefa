// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

import {System} from "@latticexyz/world/src/System.sol";
// import {BalanceTable} from "../codegen/tables/BalanceTable.sol";
// import {OwnerTable} from "../codegen/tables/OwnerTable.sol";

contract TokenSystem is System {
    event Mint(address to, uint256 token);
    event Burn(address to, uint256 token);

    function mint(uint256 token, address to) public {
        // address from = OwnerTable.get(token);
        // OwnerTable.set(token, to);
        // BalanceTable.set(from, BalanceTable.get(from) - 1);
        // BalanceTable.set(to, BalanceTable.get(to) + 1);

        emit Mint(to, token);
    }


    function burn(uint256 token, address to) public {
        // address from = OwnerTable.get(token);
        // OwnerTable.set(token, to);
        // BalanceTable.set(from, BalanceTable.get(from) - 1);
        // BalanceTable.set(to, BalanceTable.get(to) + 1);

        emit Burn(to, token);
    }
}
