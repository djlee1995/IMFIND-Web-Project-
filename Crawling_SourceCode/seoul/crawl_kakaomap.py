from urllib.parse import quote_plus

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time

url = 'https://google.co.kr/search?q='
driver = webdriver.Chrome('../driver/chromedriver') #또는 chromedriver.exe
driver.implicitly_wait(1) # 묵시적 대기, 활성화를 최대 15초가지 기다린다.

plusUrl = '서울시 버스'
url = url + quote_plus(plusUrl)
driver.get(url)

# 5초후 종료
time.sleep(5)
driver.quit() # 웹 브라우저 종료. driver.close()는 탭 종료