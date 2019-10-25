#!/usr/bin/env python3

from flask import Flask

app = Flask(__name__)
bind_addr = "0.0.0.0"
port = "8013"

@app.route("/")
def hello():
  return "Hello GitLab, deployed by Flux!"
  
if __name__ == "__main__":
  app.run(host=bind_addr, port=8013)
  
