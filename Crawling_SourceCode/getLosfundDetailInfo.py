import json
import pprint
import urllib
from urllib.parse import urlencode, quote_plus
from urllib.request import Request, urlopen
import xml.etree.ElementTree as ET

import requests


# 현재 위치주소와 근처에 위치한 지구대의 습득물 정보를 조회 할 수 있다.
import xmltodict

url = 'http://apis.data.go.kr/1320000/LosfundInfoInqireService/getLosfundDetailInfo'
api_key = 'vzJIPq3%3D%3D'
api_key_decode = requests.utils.unquote(api_key)




def queryParam():
    queryParams = '?' + urlencode({quote_plus('ServiceKey'): api_key_decode,
                                   quote_plus('ATC_ID') : 'F2020091600001727',
                                   quote_plus('FD_SN') : '1' })
    return queryParams


request = Request(url + queryParam())
request.get_method = lambda: 'GET'
response_body = urlopen(request).read()
result = response_body.decode('utf-8')

xpars = xmltodict.parse(result)
jsonDump = json.dumps(xpars)
jsonBody = json.loads(jsonDump)
pp = pprint.PrettyPrinter(indent=4)
pp.pprint(jsonBody)
