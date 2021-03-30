

import pandas as pd
import numpy as np

"""
판다스로 중복값 제거
"""

df = pd.read_csv('C:\\Users\\gutenLee\\Desktop\\seoul\\portalLost.csv' ,encoding='CP949')
print(type(df))

data = df.drop_duplicates('placeID', keep="first")
# arrr = data[['placeId','depPlace','tel', 'addr']]

data.to_csv('C:\\Users\\gutenLee\\Desktop\\seoul\\portalLost_no_duplicate.csv', header=False, index=False, encoding='utf-8-sig')