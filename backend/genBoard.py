from enum import Enum
from typing import List
from random import randint

class Difficulty(Enum):
    EASY = 10
    MEDIUM = 20
    HARD = 30
    EXPERT = 40

class Board:
    def __init__(self, *args):
        if isinstance(args, List):
            self._board = args
        else:
            self._board = [[ 0 for i in range(9) ] for j in range(9)] 

    def validateBoard(self, row: int, col: int, number: int):
        return self._checkRow(row, number) and self._checkCol(col, number) and self._checkCell(row, col, number)

    def _checkRow(self, row: int, number: int):
        return not number in self._board[row]

    def _checkCol(self, col: int, number: int):
        for row in range(0, 9):
            if self._board[row][col] == number:
                return False
        return True

    def _checkCell(self, row: int, col: int, number: int):
        for i in range(0, 9, 3):
            for j in range(0, 9, 3):
                if row <= i + 2 and row >= i and col <= j + 2 and col >= j:
                    return self._isValidCell(i, j, i, j, row, col, number)
        raise Exception("invalid sqaure !!!!")

    def _isValidCell(self, origin_row: int, origin_col: int, curr_row: int, curr_col: int, row: int, col: int, number: int):
        result = True
        if origin_row + 2 <= curr_row and origin_col <= curr_col:
            return True
        elif self._board[curr_row][curr_col] == number and curr_col != col and curr_row != row:
            result = False

        if origin_row + 2 > curr_row:
            result = result and self._isValidCell(origin_row, origin_col, curr_row + 1, curr_col, row, col, number)
        if origin_col + 2 > curr_col:
            result = result and self._isValidCell(origin_row, origin_col, curr_row, curr_col + 1, row, col, number)
        return result


class GenerateBoardMethods:
    @staticmethod
    def naive_method():
        board = Board()

    @staticmethod
    def backtracking_method():
        board = Board()
        if not GenerateBoardMethods._backtracking(board, 0, 0):
            return False  # raise Exception("not a valid board")
        return board

    @staticmethod
    def _backtracking(b: Board, row: int, col: int, check=False):
        if row >= 9:  # full board
            return True
        elif b._board[row][col] != 0:  # not empty square
            if not GenerateBoardMethods._backtracking(b, row + 1 if col == 8 else row, (col + 1) % 9):
                b._board[row][col] = 0
            else:
                return True
        else:
            options = []
            for i in range(1, 10):
                if b.validateBoard(row, col, i):
                    options.append(i)
            if not options:
                return False
            tries = 0
            while b._board[row][col] == 0 and tries < 2 * len(options):
                choice = randint(1, len(options))
                b._board[row][col] = options[choice - 1]
                if not GenerateBoardMethods._backtracking(b, row + 1 if col == 8 else row, (col + 1) % 9):
                    b._board[row][col] = 0
                tries += 1
            return b._board[row][col] != 0


class GeneratePuzzle:
    def __init__(self, board: Board, difficulty):
        self.board = board
        self.difficulty = difficulty
        self.curr_value = 0
        self.curr_sqaure = (0, 0)

    def num_clues(self):
        levels = {Difficulty.EASY: 10, Difficulty.MEDIUM: 30, Difficulty.HARD: 60, Difficulty.EXPERT: 72}
        return levels[self.difficulty]

    def generate(self):
        clues = self.num_clues()
        while clues > 0:
            # remove random sqaure from board
            self._remove()

            # check if solvable
            if not self._isSolvable():
                self.board._board[self.curr_sqaure[0]][self.curr_sqaure[1]] = self.curr_value
            else:
                # decrease counter
                clues -= 1

    def _remove(self):
        found = False
        while not found:
            row = randint(0, 8)
            col = randint(0, 8)
            found = self.board._board[row][col] != 0
        self.curr_sqaure = (row, col)
        self.curr_value = self.board._board[row][col]
        self.board._board[row][col] = 0


    def _isSolvable(self):
        copy = Board(self.board._board)
        return GeneratePuzzle.backtracking(copy)

    @staticmethod
    def backtracking(b):
        return GeneratePuzzle._backtracking(b=b, row=0, col=0)

    @staticmethod
    def _backtracking(b: Board, row: int, col: int):
        if row >= 9:  # full board
            return True
        elif b._board[row][col] != 0:  # not empty square
            if not GeneratePuzzle._backtracking(b, row + 1 if col == 8 else row, (col + 1) % 9):
                b._board[row][col] = 0
            else:
                return True
        else:
            options = 0
            for i in range(1, 10):
                if b.validateBoard(row, col, i):
                    b._board[row][col] = i
                    if not GeneratePuzzle._backtracking(b, row + 1 if col == 8 else row, (col + 1) % 9):
                        b._board[row][col] = 0
                    else:
                        options += 1
            return options == 1
