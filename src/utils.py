import pandas as pd

def read_data(type_of_data):
        data = pd.read_csv("../data/"+type_of_data+".csv")
        return data
