import pandas as pd
import matplotlib.pyplot as pyplot
import datetime
from matplotlib import style
style.use('ggplot') #usado para graficas

class NearestParking:
    def __init__(self, data, tipo_cliente):
        self.data = data
        self.tipo_cliente = tipo_cliente

    def analize_data(self):
        """
        Método que analiza la data de los parqueos de un cliente dependiendo del tipo de cliente
        Parametros:
        data: Data de los parqueos del cliente
        tipo_cliente: tipo de cliente
        Retorna: Sugerencia y promocion
        Ejemplo: [{id: 1, promo:'5% descto'}, {id: 2, promo: 'ninguna'}, {id: 6, promo: '10% descto'}]
        """
        print('Tipo cliente: {}'.format(self.tipo_cliente))

        #evaluacion por tipo cliente

        #Si el cliente es eventual, evaluar por dia de semana
        if(self.tipo_cliente == 1):
            print(datetime.datetime.today())
            print(datetime.datetime.today().weekday())
            #print(self.data)
            df = pd.DataFrame(self.data)
            df.describe()
            print(df.describe())
            #Aca te loqueas con pandas
        #Si el cliente es frecuente, evaluar por tiempo promedio
        elif(self.tipo_cliente == 2):
            print('evaluacion por tiempo promedio permanencia')
        else:
            print('evaluar al abonado, ofrecer descuento')
        
        #Ejemplo data retorno
        evaluacion = {"id": "1", "promo":"5% descto"}, {"id": "3", "promo": "ninguna"}, {"id": "6", "promo": "10% descto"}
        print(evaluacion)
        print(type(evaluacion))
        return evaluacion

