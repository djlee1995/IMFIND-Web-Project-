"""
경찰청에 분실신고된 분실물 크롤링 입니다.
"""
import csv
import json
import pprint
from datetime import datetime
from urllib.parse import urlencode, quote_plus
from urllib.request import Request, urlopen
import random
import requests
import xmltodict
import cx_Oracle
#
# connection = cx_Oracle.connect('imfind', '123456', '3.36.85.242/xe')
# cur = connection.cursor()

f = open('C:\\Users\\gutenLee\\Desktop\\sampleData2.csv', 'w', newline='')
wr = csv.writer(f)

api_key = 'vzJIPq38c6Mw7Q5fmDYv4vFn1o5fMO2Ml4Z8u5fQMTZERE4iU8aXePUDLelmk8TYl7Iy3iRfebpeKqsvqMsxYQ%3D%3D'
api_key_decode = requests.utils.unquote(api_key)
url = 'http://apis.data.go.kr/1320000/LostGoodsInfoInqireService/getLostGoodsInfoAccToClAreaPd'

def save_data(item_info):

    sql_items = """insert into lostpost (lost_postnum, lost_title, lost_content, lost_re_date, lost_up_file, 
    lost_pay, lost_item, lost_loc, lost_date, id) + values( '""" + item_info[0] + """' 
        ,'""" + item_info[1] + """'
        ,""" + item_info[2] + """
        ,""" + item_info[3] + """
        ,""" + str(item_info[4]) + """
        ,""" + item_info[5] + """
        ,""" + item_info[6] + """
        ,""" + item_info[7] + """
        ,'""" + item_info[8] + """')"""

    sql_items = sql_items.replace('\n', '')
    print(sql_items)
    # cur.execute(sql_items)


def allList(page):
    queryParams = '?' + urlencode({quote_plus('ServiceKey'): api_key_decode,
                                   quote_plus('pageNo'): page,
                                   quote_plus('numOfRows') : '10'})

    request = Request(url + queryParams)
    request.get_method = lambda: 'GET'
    response_body = urlopen(request).read()
    result = response_body.decode('utf-8')

    xpars = xmltodict.parse(result)
    jsonDump = json.dumps(xpars)
    jsonBody = json.loads(jsonDump)

    return jsonBody['response']['body']['items']
page = 1
flag = False
for i in range(1, 40):

    api_key = 'vzJIPq38c6Mw7Q5fmDYv4vFn1o5fMO2Ml4Z8u5fQMTZERE4iU8aXePUDLelmk8TYl7Iy3iRfebpeKqsvqMsxYQ%3D%3D'
    api_key_decode = requests.utils.unquote(api_key)
    url = 'http://apis.data.go.kr/1320000/LostGoodsInfoInqireService/getLostGoodsInfoAccToClAreaPd'

    queryParams = '?' + urlencode({quote_plus('ServiceKey'): api_key_decode,
                                   quote_plus('pageNo'): i,
                                   quote_plus('numOfRows') : '100'})

    request = Request(url + queryParams)
    request.get_method = lambda: 'GET'
    response_body = urlopen(request).read()
    result = response_body.decode('utf-8')

    xpars = xmltodict.parse(result)
    jsonDump = json.dumps(xpars)
    jsonBody = json.loads(jsonDump)
    pp = pprint.PrettyPrinter(indent=4)
    data = jsonBody['response']['body']
    # pp.pprint(data['items']['item'])
    if flag:
        break

    for item in data['items']['item']:
        # pp.pprint(item)
        noImg = 'https://www.lost112.go.kr/lostnfs/images/sub/img04_no_img.gif'

        code = item['atcId']
        # print(item)
        url = 'http://apis.data.go.kr/1320000/LostGoodsInfoInqireService/getLostGoodsDetailInfo'
        queryParams = '?' + urlencode({
                                        quote_plus('ServiceKey'): api_key_decode,
                                        quote_plus('ATC_ID'): code
                                      })
        request = Request(url + queryParams)
        request.get_method = lambda: 'GET'
        response_body = urlopen(request).read()
        result = response_body.decode('utf-8')

        xpars = xmltodict.parse(result)
        jsonDump = json.dumps(xpars)
        ddata = json.loads(jsonDump)
        pp = pprint.PrettyPrinter(indent=4)
        # pp.pprint(ddata['response']['body']['item'])
        table = ddata['response']['body']['item']

        today_date = datetime.today().strftime("%Y%m%d")
        print(table)
        print('L' + today_date)
        print(table['atcId'][0:9])


        if table['lstFilePathImg'] != noImg:
            lost_title = table['lstPrdtNm']
            lost_content = table['lstSbjt']
            lost_date = table['lstYmd']
            id = 'a' + str(page)
            lost_loc = table['lstPlace']
            lost_item = table['prdtClNm'].split('>')[0]
            lost_up_file = table['lstFilePathImg']
            addr = table['lstLctNm']

            tel = table['tel']
            orgNm = table['orgNm']
            orgId = table['orgId']
            menu = ['0', 12000, 45000, 10000, 100000, 50000, 9000, 200000, 30000, 25000, 500000]

            lost_pay = random.choice(menu)  # 랜덤으로 하나 선택
            idx = 20
            # print(table)
            db = [lost_title, lost_content,lost_date, lost_up_file,lost_pay, lost_date,lost_item , addr + ' | ' +lost_loc, 'a' + str(idx)]
            print(db)
            # save_data(db)
            idx += 1
            lost_up_file = '<img class="police-photo" src="' + lost_up_file + '"/>'
            print(lost_title, lost_content, lost_up_file, lost_date, lost_pay, addr + ' | ' +lost_loc, lost_item, lost_date, id, tel, code, orgNm, orgId )
            row = [lost_title, lost_content, lost_up_file, lost_date, lost_pay,  addr + ' | ' +lost_loc, lost_item, lost_date, id, tel, code, orgNm, orgId ]
            wr.writerow(row)
            if 'L' + '20210115' == table['atcId'][0:9]:
                flag = True
                break
            page += 1
f.close()

# connection.commit()
# cur.close()
# connection.close()



