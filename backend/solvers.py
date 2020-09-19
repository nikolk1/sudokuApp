from genBoard import Board

class SudokuSolversMethod:
    @staticmethod
    def backtracking(b: Board):
        return SudokuSolversMethod._backtracking(b=b, row=0, col=0)

    @staticmethod
    def _backtracking(b: Board, row: int, col: int):
        if row >= 9:  # full board
            return True
        elif b._board[row][col] != 0:  # not empty square
            if not SudokuSolversMethod._backtracking(b, row + 1 if col == 8 else row, (col + 1) % 9):
                b._board[row][col] = 0
            else:
                return True
        else:
            options = 0
            for i in range(1, 10):
                if b.validateBoard(row, col, i):
                    b._board[row][col] = i
                    if not SudokuSolversMethod._backtracking(b, row + 1 if col == 8 else row, (col + 1) % 9):
                        b._board[row][col] = 0
                    else:
                        options += 1
            return options == 1

    @staticmethod
    def noam_algo():
        pass

    @staticmethod
    def stochastic_search(b: Board):
        pass