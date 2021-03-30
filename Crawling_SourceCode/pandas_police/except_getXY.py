from urllib.parse import urlparse

key = '923e711fe1cb0429100bb0f75c5160ea'

import requests


def getResponse(addr):
    url = 'https://dapi.kakao.com/v2/local/search/address.json?&query=' + addr
    result = requests.get(urlparse(url).geturl(), headers={'Authorization': 'KakaoAK {}'.format(key)}).json()

    # pp = pprint.PrettyPrinter(indent=4)
    # pp.pprint(result['documents'][0]['road_address'])
    # address_name = result['documents'][0]['road_address']

    # x = result['documents'][0]['road_address']['x']
    # y = result['documents'][0]['road_address']['y']
    print(result)


getResponse(addr='한국택시협동조합')