from app import app
from flask import jsonify
from backend.genBoard import GeneratePuzzle, GenerateBoardMethods, Difficulty

@app.route('/')
@app.route('/index')
def index():
    return "Welcome to my Sudoku Generator !!"

@app.route('/generate/<difficulty>')
def generate(difficulty: str):
    board = GenerateBoardMethods.backtracking_method()
    if not board:
        return "500 Internal Error"
    else:
        puzzle = GeneratePuzzle(board, Difficulty[difficulty])
        puzzle.generate()
        return puzzle.board.__str__()
