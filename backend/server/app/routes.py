from app import app
from flask import render_template

@app.route('/')
@app.route('/index')
def index():
    return "hello 1!!!!!"

@app.route('/generate/', methods=["GET"])
def generate():
    pass