from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    x = 'Hello, '
    y = 'XXU test1'
    return x + y