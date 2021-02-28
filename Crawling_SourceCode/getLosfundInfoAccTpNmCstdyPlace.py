# getLosfundInfoAccTpNmCstdyPlace


import json
import urllib
from urllib.parse import urlencode, quote_plus
from urllib.request import Request, urlopen
import xml.etree.ElementTree as ET
import requests
import xmltodict as xmltodict
import pprint

# 습득물 명칭, 보관 장소별 습득물 정보 조회

url = 'http://apis.data.go.kr/1320000/LosfundInfoInqireService/getLosfundInfoAccTpNmCstdyPlace'
api_key = 'vzJIPq3Q%3D%3D'
api_key_decode = requests.utils.unquote(api_key)

def queryParam(pageNo):
    queryParams = '?' + urlencode({quote_plus('ServiceKey'): api_key_decode,
                                   quote_plus('pageNo'): pageNo,
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




