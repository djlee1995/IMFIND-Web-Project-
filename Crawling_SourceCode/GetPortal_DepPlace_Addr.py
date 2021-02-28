import csv
from urllib.parse import quote_plus

from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.common import keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
import selenium.webdriver.support.expected_conditions as EC

# driver = webdriver.Chrome(r'C:\\Users\\gutenLee\\PycharmProjects\\BusCompanCrawling\\chromedriver_win32\\chromedriver.exe')
# url = 'https://www.google.com'
# driver.get(url)

url = 'https://www.google.com/search?q='
def getSelenium(url, plusUrl):

    driver = webdriver.Chrome(r'C:\\Users\\gutenLee\\PycharmProjects\\BusCompanCrawling\\chromedriver_win32\\chromedriver.exe')
    url = url + quote_plus(plusUrl)

    driver.get(url)

    driver.implicitly_wait(2)
    html = driver.page_source
    soup = BeautifulSoup(html, "html.parser")

    driver.close()

    return soup

arr = []
with open('C:\\Users\\gutenLee\\Desktop\\seoul\\aaa.csv','r', newline='', encoding='utf-8') as f:
    reader = csv.reader(f) #확인하기 print(reader)
    print(type(reader))

    for txt in reader:
        print(type(txt))

        query = txt[0] + ' 주소'

        soup = getSelenium(url , query)

        # selenium으로 구글 검색
        # driver.implicitly_wait(2)
        # searchBox = driver.find_element_by_xpath('//*[@id="tsf"]/div[2]/div[1]/div[1]/div/div[2]/input')
        # searchBox.send_keys(query)
        # searchBox.send_keys(keys.Keys.ENTER)
        # driver.implicitly_wait(2)

        # Soup 으로 html parsing
        # html = driver.page_source
        # soup = BeautifulSoup(html, "html.parser")
        try:
            # r = soup.find(class_='X0KC1c').find(class_='mw31Ze')
            r = soup.find(class_='ifM9O').find(class_='BRoiGe')
            print(r.text)

            arr.append([query, r.text])

        except Exception:
            print(Exception)
            arr.append([query, '*'])



with open('C:\\Users\\gutenLee\\Desktop\\seoul\\포털주소못얻은주소들.csv','w', newline='') as f:
    wr = csv.writer(f) #확인하기 print(reader)

    for row in arr:
        wr.writerow(row)

