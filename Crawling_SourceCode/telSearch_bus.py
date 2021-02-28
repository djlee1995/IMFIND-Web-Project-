import csv
import pprint
from urllib.parse import urlparse

import pandas as pd
import requests

from selenium import webdriver
import selenium.webdriver.common.keys
from selenium.webdriver.common import keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
import selenium.webdriver.support.expected_conditions as EC
"""
셀레니움 카카오맵 웹 브라우저 자동화
"""
driver = webdriver.Chrome(r'C:\\Users\\gutenLee\\PycharmProjects\\BusCompanCrawling\\chromedriver_win32\\chromedriver.exe')
url = 'https://map.kakao.com/'
query = '중부운수 02-2691-7779'

def queryBusComName(query):

    driver.get(url)
    searchBox = driver.find_element_by_xpath('//*[@id="search.keyword.query"]')
    # print(searchBox)
    searchBox.send_keys(query)
    searchBox.send_keys(keys.Keys.ENTER)

    result = driver.find_element_by_xpath('//*[@id="info.search.place.list"]')
    # print(result)

    p_tag = WebDriverWait(result, timeout=5).until(EC.presence_of_element_located((By.TAG_NAME, "li")))
    # print('li 로드 완료')

    result = result.find_element_by_tag_name('li')
    comName = result.find_element_by_xpath('div[3]/strong/a[2]').text
    comAddr = result.find_element_by_xpath('div[5]/div[2]/p[1]').text
    print(comName, comAddr)


    return comAddr

def getResponse(addr):
    key = ''
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
    pp.pprint(add)

#  code	com	kind	date	depPlace	tel	email	state	state	item	info
# df = pd.read_csv('C:\\Users\\gutenLee\\Desktop\\seoul\\seoul_Lost_modified.csv' ,encoding='CP949')
# data = df.drop_duplicates("com", keep="first")
# arr = data.values.tolist()

# , encoding='utf-8'
arr = []
with open('C:\\Users\\gutenLee\\Desktop\\seoul\\하힘들다.csv', 'r') as f:
    wr = csv.reader(f)

    for item in wr:
        print(item)
        gu = item[0]
        com = item[1]
        tel = item[2].replace('?','')
        addr = item[3].replace('?','')

        try:
            if(addr == ''):
                comaddr = queryBusComName(tel)
                arr.append([tel, com, comaddr])
                print('')
            else:
                arr.append([tel, com, addr])
        except Exception:
            arr.append([tel, com, addr, ''])
            print('-')

f.close()

with open('C:\\Users\\gutenLee\\Desktop\\seoul\\AllBusAddr.csv', 'w', newline='') as f:
    wr = csv.writer(f)

    for item in arr:
        wr.writerow(item)
f.close()



