# convert data from json format to csv format
import pandas as pd

#read json data
link = "data/yelp_academic_dataset_"

types_of_data = ["business","checkin","review","tip","user"]

for type in types_of_data:
    data = pd.read_json(link+type+".json", lines=True)
    data.to_csv("data/"+type+".csv")
