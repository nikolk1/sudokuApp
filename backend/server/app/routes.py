from app import app
from flask import jsonify


@app.route('/')
@app.route('/index')
def index():
    return "Welcome to my Sudoku Generator !!"

@app.route('/generate/<level>')
def generate(level):
    return jsonify(level=level)