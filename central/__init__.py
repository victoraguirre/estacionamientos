from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from central.models import *

app = Flask(__name__)

#app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////tmp/product.db'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://usuario:password@localhost/central?charset=utf8mb4'

db = SQLAlchemy(app)
