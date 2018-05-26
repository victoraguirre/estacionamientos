# Central

Proyecto Central Parking

## Getting Started :v

Para Windows, se sugiere instalar cmder (versión git incluida) de 

```
http://cmder.net/
```

Mediante el terminal cmder, dirigirse a una capeta y clonar el repositorio usando comando

```
git clone https://github.com/victoraguirre/estacionamientos.git
```

Instalar Python, versión recomendada: 3.5.3. Se recomienda agregar el Windows PATH de forma autómatica de estar disponible

```
https://www.python.org/
```

Verificar que Python esté instalado correctamente abriendo el terminal cmder y ejecutar

```
python -V
```

Verificar que pip esté instalado correctamente abriendo el terminal cmder y ejecutar. De no estar instlado, googlear como instalar pip en Windows :v

```
which pip
```

### Prerequisitos

Mediante la consola cmder, dirigirse a la carpeta del proyecto e instalar los requerimientos con el comando

```
pip install -r requirements.txt
```

### Base de Datos

Ejecutar código sql en MySQL

```
\central\bd_scripts\central.sql
```

Edita la conección a MySQL en el proyecto con usuario y password de tu conexión local

```
\central\__init__.py
```

Línea

```
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://user:password@localhost/central?charset=utf8mb4'
```


## Lanza la app

Ejecutar comando 

```
python server.py
```

### Probar la app

Usar Postman de preferencia y probar los métodos (Headers: Content-Type=application/json)

Métodos GET (listar todos los estacionamientos)
```
http://localhost:3000/api/estacionamientos
```

Métodos POST (lista los 3 estacionamientos más cercanos de acuerdo a la ubicación enviada)
```
http://localhost:3000/api/estacionamientos

```
Body: raw/JSON

```
{
    "latitud": "-12.14716824",
    "longitud": "-77.01939216"
}
```

