import json
import urllib
from urllib.parse import urlencode, quote_plus
from urllib.request import Request, urlopen
import xml.etree.ElementTree as ET
import requests
import xmltodict as xmltodict
import pprint

# 분류별, 지역별, 기간별 습득물 정보 조회 getLosfundInfoAccToLc

url = 'http://apis.data.go.kr/1320000/LosfundInfoInqireService/getLosfundInfoAccToLc'
api_key = 'vzJIPq38c6Mw7Q3D'
api_key_decode = requests.utils.unquote(api_key)

def queryParam(pageNo):
    queryParams = '?' + urlencode({quote_plus('ServiceKey'): api_key_decode,
                                   quote_plus('pageNo'): pageNo,
                                   quote_plus('numOfRows'): '10'})
    return queryParams

# queryParams = '?' + urlencode({ quote_plus('ServiceKey') : api_key_decode,
#                                 quote_plus('pageNo') : '1',
#                                 quote_plus('numOfRows') : '10' })

for i in range(1, 4):
    request = Request(url + queryParam(i))
    request.get_method = lambda: 'GET'
    response_body = urlopen(request).read()
    result = response_body.decode('utf-8')

    xpars = xmltodict.parse(result)
    jsonDump = json.dumps(xpars)
    jsonBody = json.loads(jsonDump)
    pp = pprint.PrettyPrinter(indent=4)
    # pp.pprint(jsonBody)

    for i in jsonBody['response']['body']['items']['item']:
        pp.pprint(i)

