import csv
import json
import pprint
from urllib.parse import urlencode, quote_plus
from urllib.request import Request, urlopen

import pandas as pd
import numpy as np
import re
import matplotlib.pyplot as plt
import requests
import xmltodict

df = pd.read_csv('C:\\Users\\gutenLee\\Desktop\\crawling\\copy\\merge_police.csv' ,encoding='CP949')

is_date = df['date'] == '0'
subset_zero = df[is_date]

# print(subset_zero[['code', 'date']].tolist())

arr = list(np.array(subset_zero['code'].tolist()))
print(arr)

# 분실물 상세 조회
url = 'http://apis.data.go.kr/1320000/LosfundInfoInqireService/getLosfundDetailInfo'
# 동준 서비스키
api_key = 'SWstb7Z8SeLg6nWu2LznokB3QLO%2FatGGWh4FiWYnzJyQ%2BMZ54Np8ZasZIu0acA4D1YlJJxL0HJwXJX5W8Iq1aw%3D%3D'

# 민정 서비스키
# api_key = '4Sqotvyn9uRUR%2FBKgjFbKEYd6hx0ektJplCYOIdmM9KBQojeOACRtnTkGyEWlDWLj87ADjAignV%2FX1RWevpt1w%3D%3D'

f = open('C:\\Users\\gutenLee\\Desktop\\error_info.csv', 'w', newline='')
wr = csv.writer(f)
for code in arr:

    api_key_decode = requests.utils.unquote(api_key)

    queryParams = '?' + urlencode({quote_plus('ServiceKey'): api_key_decode,
                                   quote_plus('ATC_ID'): code,
                                   quote_plus('FD_SN'): '1'})

    request = Request(url + queryParams)
    request.get_method = lambda: 'GET'
    response_body = urlopen(request).read()
    result = response_body.decode('utf-8')

    xpars = xmltodict.parse(result)
    jsonDump = json.dumps(xpars)
    jsonBody = json.loads(jsonDump)

    pp = pprint.PrettyPrinter(indent=4)
    try:
        pp.pprint(jsonBody['response']['body']['item'])
    except TypeError:
        continue
    jsonD = jsonBody['response']['body']['item']

    try:
        # 습득물 id
        atcId = jsonD['atcId']
        # 보관 상태
        csteSteNm = jsonD['csteSteNm']
        # 보관 장소
        depPlace = jsonD['depPlace']
        # 사진 url
        fdFilePathImg = jsonD['fdFilePathImg']
        date = jsonD['fdYmd']
        # 습득 시간
        # fdHor = jsonBody['fdHor']
        # 습득 장소
        # fdPlace = jsonBody['fdPlace']
        # 습득 물건명
        fdPrdtNm = jsonD['fdPrdtNm']
        # 보관 여부
        fndKeepOrgnSeNm = jsonD['fndKeepOrgnSeNm']
        # 기관 id
        orgId = jsonD['orgId']
        # 기관명
        orgNm = jsonD['orgNm']
        # 분류
        prdtClNm = jsonD['prdtClNm'].split('>')[0]
        # 연락처
        tel = jsonD['tel']
        uniq = '내용 없음'

        result = [atcId, date, prdtClNm, fdPrdtNm, 0, 0, csteSteNm, uniq, fndKeepOrgnSeNm, orgId, orgNm, depPlace,
                  0, tel, fdFilePathImg]
        wr.writerow(result)
    except Exception:
        # 습득물 id
        atcId = jsonD['atcId']
        # 보관 상태
        csteSteNm = jsonD['csteSteNm']
        # 보관 장소
        depPlace = jsonD['depPlace']
        # 사진 url
        fdFilePathImg = jsonD['fdFilePathImg']
        date = 0
        # 습득 시간
        # fdHor = jsonBody['fdHor']
        # 습득 장소
        # fdPlace = jsonBody['fdPlace']
        # 습득 물건명
        fdPrdtNm = jsonD['fdPrdtNm']
        # 보관 여부
        fndKeepOrgnSeNm = jsonD['fndKeepOrgnSeNm']
        # 기관 id
        orgId = jsonD['orgId']
        # 기관명
        orgNm = jsonD['orgNm']
        # 분류
        prdtClNm = jsonD['prdtClNm'].split('>')[0]
        # 연락처
        tel = jsonD['tel']
        uniq = '내용 없음'

        result = [atcId, date, prdtClNm, fdPrdtNm, 0, 0, csteSteNm, uniq, fndKeepOrgnSeNm, orgId, orgNm, depPlace,
                  0, tel, fdFilePathImg]
        wr.writerow(result)


f.close()