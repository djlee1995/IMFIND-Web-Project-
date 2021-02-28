import json
import pprint
import urllib
from urllib.parse import urlencode, quote_plus
from urllib.request import Request, urlopen
import xml.etree.ElementTree as ET

import requests


# 현재 위치주소와 근처에 위치한 지구대의 습득물 정보를 조회 할 수 있다.
import xmltodict

url = 'http://apis.data.go.kr/1320000/LosfundInfoInqireService/getLosfundInfoAccToLc'
api_key = 'vzJIPq38c6Mw7Q%3D%3D'
api_key_decode = requests.utils.unquote(api_key)




def queryParam(pageNo):
    queryParams = '?' + urlencode({quote_plus('ServiceKey'): api_key_decode,
                                   # quote_plus('ADDR'): '서울 중구 을지로 234',
                                   quote_plus('pageNo'): '1',
                                   quote_plus('numOfRows'): '10'})
    return queryParams

for i in range(1, 4):
    request = Request(url + queryParam(i))
    request.get_method = lambda: 'GET'
    response_body = urlopen(request).read()
    result = response_body.decode('utf-8')

    xpars = xmltodict.parse(result)
    jsonDump = json.dumps(xpars)
    jsonBody = json.loads(jsonDump)
    pp = pprint.PrettyPrinter(indent=4)
    pp.pprint(jsonBody)

    stack = []
    for i in jsonBody['response']['body']['items']['item']:
        # id, 습득물 이름,
        [i['atcId'], i['fdPrdtNm'], i['prdtClNm'], i['']]
        pp.pprint(i)