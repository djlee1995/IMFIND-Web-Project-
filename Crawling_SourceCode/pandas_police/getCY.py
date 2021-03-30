import pprint
import csv
import pandas as pd

key = '923e711fe1cb0429100bb0f75c5160ea'

import requests
from urllib.parse import urlparse

placeId = []
depPlace = []
tel = []
addr = []
x = []
y = []
city = []
gu = []
dong = []

def getResponse(addr):
    url = 'https://dapi.kakao.com/v2/local/search/address.json?&query=' + addr
    result = requests.get(urlparse(url).geturl(), headers={'Authorization': 'KakaoAK {}'.format(key)}).json()

    # pp = pprint.PrettyPrinter(indent=4)
    # pp.pprint(result['documents'])
    # address_name = result['documents'][0]['road_address']

    # 'region_1depth_name': '서울', 'region_2depth_name': '강남구', 'region_3depth_name': '개포동'

    xx = result['documents'][0]['address']['x']
    yy = result['documents'][0]['address']['y']
    city_is = result['documents'][0]['address']['region_1depth_name']
    gu_is = result['documents'][0]['address']['region_2depth_name']
    dong_is = result['documents'][0]['address']['region_3depth_name']

    print(xx, yy, city_is, gu_is, dong_is)
    return xx, yy, city_is, gu_is, dong_is


arr =[]


with open('C:\\Users\\gutenLee\\Desktop\\crawling\\copy\\addr.csv','r', encoding='utf-8') as f:
    reader = csv.reader(f)

    for a in reader:
        placeId.append(a[0])
        depPlace.append(a[1])
        addr.append(a[3])
        tel.append(a[2])

        # result = getResponse(a[3])

        try:
            print(a[3])
            result = getResponse(a[3])
            x.append(result[0])
            y.append(result[1])
            city.append(result[2])
            gu.append(result[3])
            dong.append(result[4])

        except Exception:
            x.append(0)
            y.append(0)
            city.append(0)
            gu.append(0)
            dong.append(0)

        print(result[0], result[1])
    f.close()

df = pd.DataFrame({"placeId": placeId,
                   "city" : city,
                   "gu" : gu,
                   "dong" : dong,
                   "depPlace": depPlace,
                   "addr": addr,
                   "tel": tel,
                   "x": x,
                   "y": y})
# print(df)
# df.to_csv("C:\\Users\\gutenLee\\Desktop\\crawling\copy\\getXY2.csv", sep=",", encoding='utf-8-sig')

# x.append(0)
# y.append(0)
# city.append(0)
# gu.append(0)
# dong.append(0)