import requests
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/follow')
def follow_url():
    url = request.args.get('url', '')
    if url:
        return (requests.get(url).text)

    return "no url parameter provided"
