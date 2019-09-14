from flask import Flask
import os
import socket

app = Flask(__name__)
@app.route("/")

def hello():
    html = "<body bgcolor='{bgname}'><h3>Hello {name}!</h3> <b>Hostname:</b> {hostname}<br/></body>"
    return html.format(name=os.getenv("NAME", "world"), hostname=socket.gethostname(), bgname=os.getenv("BGNAME", "orange"))

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=4000)
