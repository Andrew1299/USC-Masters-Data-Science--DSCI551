# -*- coding: utf-8 -*-
"""create_index.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1cFdkhhlZ6TMX8vVbJHXuRHqkVBnTguuy
"""

from pandas.core.indexes.extension import Index
import re
import sys
import json
import requests
import pandas as pd

df = pd.read_csv('cars (1).csv')
df.head()

names=df['CarName'].unique()
nameList=names.tolist()
print(nameList)
#convert to str to tokenize
namestr=' '.join(nameList)

namestr=namestr.lower()

# Tokenize the list
#index=namestr.split()
index=re.split(r"-| ", namestr)
index_set = [*set(index)]

if "" in index_set:
  index_set.remove("")
index_set

#create dictionary
carIDs=df.set_index('car_ID').to_dict()['CarName']
#carIDs

#List of results for the keyword search

from collections import defaultdict
results = defaultdict(list)

#Map index_set ot carIDs
for keyword in index_set:
  for ID in carIDs:
    #print(keyword)
    #print(carIDs[ID])
    if keyword in (carIDs[ID]).lower():
      results[keyword].append(ID)
    

#Convert to JSON
json_object = json.dumps(results) 
print(json_object)
#upload to firebase
requests.put('https://dsci-551-28ea6-default-rtdb.firebaseio.com/index.json/', json = json_object)