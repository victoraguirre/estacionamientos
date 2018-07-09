from central import db

"""
class Estacionamiento(db.Model):
    __tablename__ = 'estacionamientos'
    id = db.Column(db.Integer, primary_key=True)
    descripcion = db.Column(db.String(45), unique=False)
    latitud = db.Column(db.String(45), unique=False)
    longitud = db.Column(db.String(45), unique=False)
    capacidad = db.Column(db.String(45), unique=False)
"""

class Reserva(db.Model):
    __tablename__ = 't_reserva'
    codigo_reserva = db.Column(db.String(45), primary_key =True)
    fecha_inicio_reserva = db.Column(db.Date(), unique=False)
    hora_inicio_reserva  = db.Column(db.Time(), unique=False)
    fecha_fin_reserva = db.Column(db.Date(), unique=False)
    hora_fin_reserva = db.Column(db.Time(), unique=False)
    numero_placa_vehiculo = db.Column(db.String(45), unique=False)
    codigo_playa = db.Column(db.String(45), unique=False)
    espacio_asignado = db.Column(db.Integer, unique=False)
    estado_espacio_asignado = db.Column(db.String(45), unique=False)
    estado_reserva = db.Column(db.String(45), unique=False)

