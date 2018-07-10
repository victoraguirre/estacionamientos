from flask import jsonify, request
from central import db, app
'''from central.models.estacionamiento import Estacionamiento'''
from central.models.estacionamiento import Reserva
from central.analisis.nearestParking import NearestParking
import json
import mpu

"""
@app.route("/api/estacionamientos", methods=["POST"])
def list_estacionamientos_near():
    estacionamiento = Estacionamiento.query.order_by(Estacionamiento.id).all()
    json = request.get_json()
    my_latitud = float(json.get("latitud"))
    my_longitud = float(json.get("longitud"))

    lista = []
    for est in estacionamiento:
        dict = {}
        lat2 = float(est.latitud)
        lon2 = float(est.longitud)
        dist = mpu.haversine_distance((my_latitud, my_longitud), (lat2, lon2))
        dict['id'] = est.id
        dict['dist'] = dist
        dict['est'] = est
        lista.append(dict)
    newlist = sorted(lista, key=lambda k: k['dist'])
    filtrados = [x['id'] for x in newlist[:3]]
    '''
    for index,item in enumerate(lista):
        print(item)
        print(index)
        print(item['est'].descripcion)'''
    #Filtrar a la tabla detalle de los parqueos de los estacionamientos mas cercanos
    try:
        queryset = Estacionamiento.query.filter(Estacionamiento.id.in_(filtrados)).all()
    except Exception as e:
        print(str(e))

    #Crear variable data de acuerdo al modelo del detalle, este se enviará al modelo pandas para ser analizado
    data = [{"id": x.id, "descripcion": x.descripcion, "longitud": x.longitud, "latitud": x.latitud, "capacidad": x.capacidad} for x in queryset]
    #print(data)

    #Tener el tipo de cliente del usuario, ejemplo 1=Eventual, 2=Frecuente, 3=Abonado
    tipo_cliente = 1
    analize = NearestParking(data, tipo_cliente)
    evalu = analize.analize_data()
    return jsonify({
            "items": [{"id": x.id, "descripcion": x.descripcion, "longitud": x.longitud, "latitud": x.latitud, "capacidad": x.capacidad} for x in queryset]
    , "evaluacion": evalu}), 200


@app.route("/api/estacionamientos", methods=["GET"])
def list_estacionamientos():
    estacionamiento = Estacionamiento.query.order_by(Estacionamiento.id).all()
    return jsonify({
            "items": [{"id": x.id, "descripcion": x.descripcion, "longitud": x.longitud, "latitud": x.latitud, "capacidad": x.capacidad} for x in estacionamiento]
        }), 200
"""
@app.route("/api/reservas", methods=["GET"])
def list_reservas():
    reservas = Reserva.query.order_by(Reserva.codigo_reserva).all()
    return jsonify({
            "items": [{"codigo_reserva": x.codigo_reserva, "placa": x.numero_placa_vehiculo} for x in reservas]
        }), 200

@app.route("/api/reservas_placa", methods=["POST"])
def list_reservas_placa():
    json = request.get_json()
    placa = json.get("placa")
    #distrito = json.get("distrito")

    reservas = Reserva.query.filter_by(numero_placa_vehiculo=placa).all()
    #playas = Playa.query.filter_by(distrito=distrito).all()
    """
    return jsonify({
            "items": [{"codigo_reserva": x.codigo_reserva, "placa": x.numero_placa_vehiculo} for x in reservas]
        }), 200
    """

    #Crear variable data de acuerdo al modelo del detalle, este se enviará al modelo pandas para ser analizado
    data = [{"codigo_reserva": x.codigo_reserva, "placa": x.numero_placa_vehiculo, "espacio": x.espacio_asignado} for x in reservas]
    #print(data)

    #Tener el tipo de cliente del usuario, ejemplo 1=Eventual, 2=Frecuente, 3=Abonado
    tipo_cliente = 1
    analize = NearestParking(data, tipo_cliente)
    evalu = analize.analize_data()
    return jsonify({
            "items": [{"codigo_reserva": x.codigo_reserva, "placa": x.numero_placa_vehiculo} for x in reservas]
    , "evaluacion": evalu}), 200
