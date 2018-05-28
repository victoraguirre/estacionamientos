from flask import jsonify, request
from central import db, app
from central.models.estacionamiento import Estacionamiento
from central.analisis.nearestParking import NearestParking
import json
import mpu

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
    try:
        queryset = Estacionamiento.query.filter(Estacionamiento.id.in_(filtrados)).all()
    except Exception as e:
        print(str(e))
    data = [{"id": x.id, "descripcion": x.descripcion, "longitud": x.longitud, "latitud": x.latitud, "capacidad": x.capacidad} for x in queryset]
    print(data)
    analize = NearestParking(data)
    analize.analize_data()
    return jsonify({
            "items": [{"id": x.id, "descripcion": x.descripcion, "longitud": x.longitud, "latitud": x.latitud, "capacidad": x.capacidad} for x in queryset]
        }), 200

@app.route("/api/estacionamientos", methods=["GET"])
def list_estacionamientos():
    estacionamiento = Estacionamiento.query.order_by(Estacionamiento.id).all()
    return jsonify({
            "items": [{"id": x.id, "descripcion": x.descripcion, "longitud": x.longitud, "latitud": x.latitud, "capacidad": x.capacidad} for x in estacionamiento]
        }), 200
