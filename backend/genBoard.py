
class Board:
    def __init__(self):
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
        GenerateBoardMethods._backtracking(board, 0, 0)
        return board

    @staticmethod
    def _backtracking(b: Board, row: int, col: int):
        if row >= 9:  # full board
            return True
        elif b._board[row][col] != 0:  # not empty square
            if not GenerateBoardMethods._backtracking(b, row + 1 if col == 8 else row, (col + 1) % 9):
                b._board[row][col] = 0
            else:
                return True
        else:
            for i in range(1, 10):
                if b.validateBoard(row, col, i):
                    b._board[row][col] = i
                    if not GenerateBoardMethods._backtracking(b, row + 1 if col == 8 else row, (col + 1) % 9):
                        b._board[row][col] = 0
                    else:
                        return True
            return False


b = GenerateBoardMethods.backtracking_method()
print(b)

