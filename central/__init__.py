from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from central.models import *

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:mysql2@localhost/central?charset=utf8mb4'

db = SQLAlchemy(app)
