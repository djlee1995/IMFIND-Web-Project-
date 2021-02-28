import csv
import json
import pprint
from urllib.parse import urlencode, quote_plus
from urllib.request import Request, urlopen
import requests
import xmltodict

"""
경찰청 이외의 분실물 REST API
"""


f = open('C:\\Users\\gutenLee\\Desktop\\seoul\\dd.csv', 'w', newline='')
wr = csv.writer(f)


def getLosfundDetailInfo(code):

    # 분실물 상세 조회
    url = 'http://apis.data.go.kr/1320000/LosPtfundInfoInqireService/getPtLosfundDetailInfo'

    # 동준 서비스키
    # api_key = 'SW%3D%3D'
    api_key = 'vzJIPD%3D'
    # 민정 서비스키
    # api_key = '4Sq3D%3D'

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
    # pp.pprint(jsonBody['response']['body']['item'])

    return jsonBody['response']['body']['item']

def getLosfundInfoAccToLc(pageNo):



    # 위치기반 조회 ( 주소 )
    url = 'http://apis.data.go.kr/1320000/LosPtfundInfoInqireService/getPtLosfundInfoAccToLc'

    # 동준 서비스키
    # api_key = 'SWstb7Z8SL0HJwXJX5W8Iq1aw%3D%3D'
    api_key = 'vzJIPq38c6M%3D%3D'
    # 민정 서비스키
    # api_key = '4Sqotw%3D%3D'

    url = 'http://apis.data.go.kr/1320000/LosPtfundInfoInqireService/getPtLosfundInfoAccToClAreaPd'

    api_key_decode = requests.utils.unquote(api_key)
    queryParams = '?' + urlencode(
        {quote_plus('ServiceKey'): api_key_decode,
         quote_plus('pageNo'): pageNo,
         quote_plus('numOfRows'): '100',
         quote_plus('START_YMD'): '20210113',
         quote_plus('END_YMD'): '20210113'})
    #   조회 날짜 설정

    request = Request(url + queryParams)
    request.get_method = lambda: 'GET'
    response_body = urlopen(request).read()
    result = response_body.decode('utf-8')

    xpars = xmltodict.parse(result)
    jsonDump = json.dumps(xpars)
    jsonBody = json.loads(jsonDump)

    jsonData = jsonBody['response']['body']['items']['item']
    pp = pprint.PrettyPrinter(indent=4)
    # pp.pprint(jsonBody)

    return jsonData

page = 1

while (True):
    result = []
    try:
        getLostByLocation = getLosfundInfoAccToLc(page)
    except Exception:
        break
    # 주소 기반 조회 리스트 출력 코드
    # pp = pprint.PrettyPrinter(indent=4)
    # pp.pprint(getLostByLocation)

    for item in getLostByLocation:
        try:

        # {'addr': '경북 안동시 경동로 656 (운흥동, 홈플러스)', 'atcId': 'V0003976F11290026', 'depPlace': '홈플러스(안동점)',
        #  'fdPrdtNm': '경북통합도서관카드', 'fdSbjt': '경북통합도서관카드(딥스카이블루(새파란하늘)색)을 습득하여 보관하고 있습니다.', 'fdSn': '1',
        #  'fdYmd': '2019-12-08', 'prdtClNm': '카드 > 기타카드', 'rnum': '1'}

            atcId = item['atcId']
            depPlace1 = item['depPlace']
            fdPrdtNm1 = item['fdPrdtNm']
            fdSbjt1 = item['fdSbjt']
            fdYmd1 = item['fdYmd']
            prdtClNm1 = item['prdtClNm'].split('>')[0]

            DetailInfo = getLosfundDetailInfo(atcId)
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
            # fndKeepOrgnSeNm = DetailInfo['fndKeepOrgnSeNm']
            # 기관 id
            orgId = DetailInfo['orgId']
            # 기관명
            orgNm = DetailInfo['orgNm']
            # 분류
            prdtClNm = DetailInfo['prdtClNm'].split('>')[0]
            # 연락처
            tel = DetailInfo['tel']
            try:
                uniq = DetailInfo['uniq'].replace('\r', '').replace('\n', '')
            except Exception:
                uniq = DetailInfo['uniq']

            date = DetailInfo['fdYmd']

            # print(DetailInfo['uniq'].strip())

            # 습득물id, 분류, 습득 물건명, 습득 시간, 습득 장소, 보관 상태, 보관 장소,문구 ,보관 여부 ,기관 id ,기관명 , 연락처, 사진url <기관명, 보관장소, 주소, 연락처>
            result = [atcId, date, prdtClNm, fdPrdtNm, fdHor, fdPlace, csteSteNm, uniq, '', orgId, orgNm,
                      depPlace, 'addr1', tel, fdFilePathImg]
            # print(addr, atcId, depPlace, fdPrdtNm, fdSbjt, fdYmd, prdtClNm)
            # row = [atcId, fdYmd, prdtClNm, fdPrdtNm, depPlace, fdSbjt, addr ]

            print(atcId)
            wr.writerow(result)


        except Exception:
            # result = [atcId, date, prdtClNm, fdPrdtNm, fdHor, fdPlace, csteSteNm, '', '', orgId, orgNm,
            #           depPlace, '', tel, fdFilePathImg]
            # wr.writerow(result)
            print('에러 발생 =>' + atcId)
            continue
    page += 1

f.close()
