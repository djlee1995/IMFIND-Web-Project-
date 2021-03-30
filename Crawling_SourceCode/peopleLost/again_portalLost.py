import csv
import json
import pprint
from datetime import datetime
from urllib.parse import urlencode, quote_plus
from urllib.request import Request, urlopen
import requests
import xmltodict

"""
경찰청 분실물 Rest API
"""


# f = open('C:\\Users\\gutenLee\\Desktop\\police.csv', 'w', newline='')
# wr = csv.writer(f)

def getLosfundDetailInfo(code):
    # 분실물 상세 조회
    url = 'http://apis.data.go.kr/1320000/LosfundInfoInqireService/getLosfundDetailInfo'
    # 동준 서비스키
    api_key = 'SWstb7Z8SeLg6nWu2LznokB3QLO%2FatGGWh4FiWYnzJyQ%2BMZ54Np8ZasZIu0acA4D1YlJJxL0HJwXJX5W8Iq1aw%3D%3D'

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
    return jsonBody['response']['body']['item']


def getLosfundInfoAccToLc(pageNo):
    # 위치기반 조회 ( 주소 )
    url = 'http://apis.data.go.kr/1320000/LosfundInfoInqireService/getLosfundInfoAccToLc'
    # 동준 서비스키
    api_key = 'SWstb7Z8SeLg6nWu2LznokB3QLO%2FatGGWh4FiWYnzJyQ%2BMZ54Np8ZasZIu0acA4D1YlJJxL0HJwXJX5W8Iq1aw%3D%3D'

    api_key_decode = requests.utils.unquote(api_key)
    queryParams = '?' + urlencode({quote_plus('ServiceKey'): api_key_decode,
                                   quote_plus('pageNo'): pageNo,
                                   quote_plus('numOfRows'): '100'})
    request = Request(url + queryParams)
    request.get_method = lambda: 'GET'
    response_body = urlopen(request).read()
    result = response_body.decode('utf-8')
    xpars = xmltodict.parse(result)
    jsonDump = json.dumps(xpars)
    jsonBody = json.loads(jsonDump)
    jsonData = jsonBody['response']['body']['items']['item']
    pp = pprint.PrettyPrinter(indent=4)
    # pp.pprint(jsonData)
    return jsonData


def loop(data):
    for item in data:
        try:
            print(item['atcId'][0:9])
            print('today' + today_date)

            if 'F' + today_date != item['atcId'][0:9]:
                return False
            code = item['atcId']
            addr = item['addr']
            date = item['fdYmd']
            DetailInfo = getLosfundDetailInfo(code)
            # print(DetailInfo)
            # 습득물 id
            atcId = DetailInfo['atcId']
            # 보관 상태
            csteSteNm = DetailInfo['csteSteNm']
            # 보관 장소
            depPlace = DetailInfo['depPlace']
            # 사진 url
            fdFilePathImg = DetailInfo['fdFilePathImg']
            # 습득 시간
            fdHor = DetailInfo['fdHor']
            # 습득 장소
            fdPlace = DetailInfo['fdPlace']
            # 습득 물건명
            fdPrdtNm = DetailInfo['fdPrdtNm']
            # 보관 여부
            fndKeepOrgnSeNm = DetailInfo['fndKeepOrgnSeNm']
            # 기관 id
            orgId = DetailInfo['orgId']
            # 기관명
            orgNm = DetailInfo['orgNm']
            # 분류
            prdtClNm = DetailInfo['prdtClNm'].split('>')[0]
            # 연락처
            tel = DetailInfo['tel']
            uniq = DetailInfo['uniq'].replace('\r', '').replace('\n', '')
            # print(DetailInfo['uniq'].strip())

            # 습득물id, 분류, 습득 물건명, 습득 시간, 습득 장소, 보관 상태, 보관 장소,문구 ,보관 여부 ,기관 id ,기관명 , 연락처, 사진url <기관명, 보관장소, 주소, 연락처>
            result = [atcId, date, prdtClNm, fdPrdtNm, fdHor, fdPlace, csteSteNm, uniq, fndKeepOrgnSeNm, orgId, orgNm,
                      depPlace, addr, tel, fdFilePathImg]
            print(result)
            # wr.writerow(result)

        except Exception:
            print('에러 발생 =>' + code)


page = 1
today_date = datetime.today().strftime("%Y%m%d")

while (True):
    print(page)
    print(today_date)
    try:
        getLostByLocation = getLosfundInfoAccToLc(page)

        # 분실물 아디이의 날짜 부분과 오늘 날짜를 비교하여 일치하지 않으면 데이터 수집 종료
        flag = loop(getLostByLocation)
        if not flag:
            break
    except Exception:
        break
    page += 1
# f.close()
