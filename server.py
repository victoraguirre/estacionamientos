from central import db, app
from central.api import estacionamiento
from flask import Flask, Response, request, render_template

@app.route("/")
def welcome_to_home():
    return "Welcome to Central Parking"


if __name__ == "__main__":
    #db.create_all()
    app.run(port=3000, host="localhost", debug=True)
