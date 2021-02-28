
import pandas as pd
import csv
import json
import urllib
from urllib.parse import urlencode, quote_plus
from urllib.request import Request, urlopen
import xml.etree.ElementTree as ET
import requests
import xmltodict as xmltodict
import pprint

# 습득한 물품에 대한 분류, 지역, 기간 정보를 조회 할 수 있다.


f = open('C:\\Users\\gutenLee\\Desktop\\police.csv', 'w', newline='')
wr = csv.writer(f)

url = 'http://apis.data.go.kr/1320000/LosfundInfoInqireService/getLosfundInfoAccToClAreaPd'

# api_key = 'vzJIPq383D' 내꺼

# 동준 서비스키
api_key = 'SWstb7Z85W8Iq1aw%3D%3D'
api_key_decode = requests.utils.unquote(api_key)


def queryParam(pageNo):
    queryParams = '?' + urlencode({quote_plus('ServiceKey'): api_key_decode,
                                   quote_plus('pageNo'): pageNo,
                                   quote_plus('START_YMD'): '20191230', quote_plus('END_YMD'): '20201222',
                                   quote_plus('numOfRows'): '100'})
    return queryParams


def getTel(id):
    url = 'http://apis.data.go.kr/1320000/LosfundInfoInqireService/getLosfundDetailInfo'
    api_key = 'vzJIPq38c6Mw3D'
    api_key_decode = requests.utils.unquote(api_key)
    queryParams = '?' + urlencode({quote_plus('ServiceKey'): api_key_decode,
                                   quote_plus('ATC_ID'): 'F2020121700000024',
                                   quote_plus('FD_SN'): '1'})

    request = Request(url + queryParams)
    request.get_method = lambda: 'GET'
    response_body = urlopen(request).read()
    result = response_body.decode('utf-8')

    xpars = xmltodict.parse(result)
    jsonDump = json.dumps(xpars)
    jsonBody = json.loads(jsonDump)

    tel = jsonBody['response']['body']['item']['tel']
    return tel


def getUniq(code):
    url = 'http://apis.data.go.kr/1320000/LosfundInfoInqireService/getLosfundDetailInfo'
    api_key = 'vzJIPqebpeKqsvqMsxYQ%3D%3D'
    api_key_decode = requests.utils.unquote(api_key)
    queryParams = '?' + urlencode({quote_plus('ServiceKey'): api_key_decode,
                                   quote_plus('ATC_ID'): 'F2020121700000024',
                                   quote_plus('FD_SN'): '1'})

    request = Request(url + queryParams)
    request.get_method = lambda: 'GET'
    response_body = urlopen(request).read()
    result = response_body.decode('utf-8')

    xpars = xmltodict.parse(result)
    jsonDump = json.dumps(xpars)
    jsonBody = json.loads(jsonDump)

    uniq = jsonBody['response']['body']['item']['uniq']
    fdPlace = jsonBody['response']['body']['item']['fdPlace']
    return fdPlace, uniq


def findLocation(id):
    url = 'http://apis.data.go.kr/1320000/LosfundInfoInqireService/getLosfundDetailInfo'
    # api_key = 'vzJIPq38c6M%3D%3D'

    # 동준 서비스키
    api_key = 'SWstb7Z8SeLg6n%3D%3D'
    api_key_decode = requests.utils.unquote(api_key)
    queryParams = '?' + urlencode({quote_plus('ServiceKey'): api_key_decode,
                                   quote_plus('ATC_ID'): id,
                                   quote_plus('FD_SN'): '1'})

    request = Request(url + queryParams)
    request.get_method = lambda: 'GET'
    response_body = urlopen(request).read()
    result = response_body.decode('utf-8')

    xpars = xmltodict.parse(result)
    jsonDump = json.dumps(xpars)
    jsonBody = json.loads(jsonDump)

    # pp = pprint.PrettyPrinter(indent=4)
    # pp.pprint(jsonBody)

    return jsonBody['response']['body']['item']



duplicate_id = []
page = 1
while (True):
    print(page)

    try:
        request = Request(url + queryParam(page))
        request.get_method = lambda: 'GET'
        response_body = urlopen(request).read()
        # print(url + queryParam(page))
        result = response_body.decode('utf-8')

        xpars = xmltodict.parse(result)
        jsonDump = json.dumps(xpars)
        jsonBody = json.loads(jsonDump)


        if jsonBody['response']['header']['resultCode'] != '00':
            break
        # pp = pprint.PrettyPrinter(indent=4)
        # pp.pprint(jsonBody)

        for i in jsonBody['response']['body']['items']['item']:

            code = i['atcId']

            jsonData = findLocation(code)

            if(code in duplicate_id):
                duplicate_id = []
                continue
            else:
                duplicate_id = []

            jsonData = findLocation(code)
            # print(jsonData)

            # 습득물 id
            atcId = jsonData['atcId']
            # 보관 상태
            csteSteNm = jsonData['csteSteNm']
            # 보관 장소
            depPlace = jsonData['depPlace']
            # 사진 url
            fdFilePathImg = jsonData['fdFilePathImg']
            # 습득 시간
            fdHor = jsonData['fdHor']
            # 습득 장소
            fdPlace = jsonData['fdPlace']
            # 습득 물건명
            fdPrdtNm = jsonData['fdPrdtNm']
            # 보관 여부
            fndKeepOrgnSeNm = jsonData['fndKeepOrgnSeNm']
            # 기관 id
            orgId = jsonData['orgId']
            # 기관명
            orgNm = jsonData['orgNm']
            # 분류
            prdtClNm = jsonData['prdtClNm'].split('>')[0]
            # 연락처
            tel = jsonData['tel']
            uniq = jsonData['uniq'].replace('\r','').replace('\n','')

            # 습득물id, 분류, 습득 물건명, 습득 시간, 습득 장소, 보관 상태, 보관 장소,문구 ,보관 여부 ,기관 id ,기관명 , 연락처, 사진url
            result = [atcId, prdtClNm, fdPrdtNm, fdHor, fdPlace, csteSteNm, depPlace, uniq, fndKeepOrgnSeNm, orgId,
                       orgNm, tel, fdFilePathImg]
            print(result)

            wr.writerow(result)
            duplicate_id.append(code)

    except Exception:
        print(Exception)
        print("code => " + code)
        result = [code, '0', '0', '0', '0', '0', '0', '0']
        wr.writerow(result)
        print('에러 발생하여 종료함 =>' + code)
    page += 1
f.close()



