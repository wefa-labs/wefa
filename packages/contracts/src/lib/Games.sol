// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

error InvalidMove();

library GamesLib {
    function checkTicTacToeMove(uint8[] memory board) private pure returns (bool) {
        // Check rows
        for (uint8 row = 0; row < 3; row++) {
            if (board[row * 3] != 0 && board[row * 3] == board[row * 3 + 1] && board[row * 3] == board[row * 3 + 2]) {
                return true;
            }
        }

        // Check columns
        for (uint8 col = 0; col < 3; col++) {
            if (board[col] != 0 && board[col] == board[col + 3] && board[col] == board[col + 6]) {
                return true;
            }
        }

        // Check diagonals
        if (board[0] != 0 && board[0] == board[4] && board[0] == board[8]) {
            return true;
        }

        if (board[2] != 0 && board[2] == board[4] && board[2] == board[6]) {
            return true;
        }

        return false;
    }

    function checkLudoMove(uint8[] memory board) private pure returns (bool) {
        // Check rows
        for (uint8 row = 0; row < 3; row++) {
            if (board[row * 3] != 0 && board[row * 3] == board[row * 3 + 1] && board[row * 3] == board[row * 3 + 2]) {
                return true;
            }
        }

        // Check columns
        for (uint8 col = 0; col < 3; col++) {
            if (board[col] != 0 && board[col] == board[col + 3] && board[col] == board[col + 6]) {
                return true;
            }
        }

        // Check diagonals
        if (board[0] != 0 && board[0] == board[4] && board[0] == board[8]) {
            return true;
        }

        if (board[2] != 0 && board[2] == board[4] && board[2] == board[6]) {
            return true;
        }

        return false;
    }
}
