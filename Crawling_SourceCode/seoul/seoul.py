import csv
import pprint
from urllib.parse import urlparse
import requests

"""
kakao map api에 주소 요청하여
시, 구, 동 & x, y 좌표 수집하는 함수
"""

def getResponse(addr):
    key = '923e711fe1cb0429100bb0f75c5160ea'
    url = 'https://dapi.kakao.com/v2/local/search/address.json?&query=' + addr
    # url = 'https://dapi.kakao.com/v2/search/web?&query=' + addr
    result = requests.get(urlparse(url).geturl(), headers={'Authorization': 'KakaoAK {}'.format(key)}).json()

    # pp = pprint.PrettyPrinter(indent=4)
    # pp.pprint(result['documents'][0]['road_address'])
    # address_name = result['documents'][0]['road_address']

    # x = result['documents'][0]['road_address']['x']
    # y = result['documents'][0]['road_address']['y']

    pp = pprint.PrettyPrinter(indent=4)
    # pp.pprint(result)
    add = result
    # pp.pprint(add)
    return result['documents']
code = ''

arr = []
#  placeId	city	gu	dong	depPlace	addr	tel	x	y  , encoding='utf-8'
with open('C:\\Users\\gutenLee\\Desktop\\seoul\\힘들다.csv','r', newline='') as f:
    reader = csv.reader(f) #확인하기 print(reader)
    # print(reader)

    for txt in reader:
        try:

            # query = txt[1].split(' ')
            # if(len(query) > 1):
            #     query = query[0]
            query = txt[3]
            print(query)
            try:
                result = getResponse(query)
            except Exception:
                continue
            print(result)
            result = result[0]

            code = txt[0]
            com = txt[1]
            tel = txt[2]

            address_name = result['address']['address_name']
            region_1depth_name = result['address']['region_1depth_name']
            region_2depth_name = result['address']['region_2depth_name']
            region_3depth_name = result['address']['region_3depth_name']
            x = result['address']['x']
            y = result['address']['y']

            #  placeId	city	gu	dong	depPlace	addr	tel	x	y
            # V0000427	샛강역 9호선	서울	영등포구	여의동	서울 영등포구 여의도동 5-6	02-2656-0916	126.9290797	37.5166297
            print([code, region_1depth_name, region_2depth_name, region_3depth_name, com, address_name, tel])
            arr.append([code, com, region_1depth_name, region_2depth_name, region_3depth_name, address_name, tel, y, x])

        except Exception:
            # arr.append([code, com, '', '', '', txt[2], tel, '', ''])
            arr.append([code, com, '', '', '', '', tel, '', ''])



# 0, 4
f.close()
with open('C:\\Users\\gutenLee\\Desktop\\seoul\\포털주소222.csv','w', newline='') as f:
    wr = csv.writer(f) #확인하기 print(reader)
    # print(reader)

    for txt in arr:
        wr.writerow(txt)


f.close()