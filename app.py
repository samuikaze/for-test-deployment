# -*- coding: utf-8 -*-

from flask import Flask
import os

app = Flask(__name__)

@app.route("/", methods=['GET'])
def helloworld():
    return 'Hello World'

if __name__ == "__main__":
    port = int(os.environ.get('PORT', 4200))
    app.run(host='0.0.0.0', port=port)
