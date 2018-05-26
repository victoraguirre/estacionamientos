from central import db

class Estacionamiento(db.Model):
    __tablename__ = 'estacionamientos'
    id = db.Column(db.Integer, primary_key=True)
    descripcion = db.Column(db.String(45), unique=False)
    latitud = db.Column(db.String(45), unique=False)
    longitud = db.Column(db.String(45), unique=False)
    capacidad = db.Column(db.String(45), unique=False)
