import pandas as pd
import matplotlib.pyplot as pyplot
from matplotlib import style
style.use('ggplot') #usado para graficas

class NearestParking:
    def __init__(self, data):
        self.data = data

    def analize_data(self):
        print('aca')
        #print(self.data)
        df = pd.DataFrame(self.data)
        print(df)
        #Aca te loqueas con pandas
