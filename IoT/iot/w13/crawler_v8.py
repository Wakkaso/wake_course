# coding: utf-8
from bs4 import BeautifulSoup
from selenium import webdriver
import datetime
import time

data = []

region = 'Tainan'
#台南測站觀測資料
url = 'https://www.cwb.gov.tw/V8/C/W/OBS_Station.html?ID=46741'

#啟動模擬瀏覽器
driver = webdriver.Chrome()

#取得網頁代碼
driver.get(url)
while(1):
    driver.refresh()
    open(region+'.html','wb').write(driver.page_source.encode('utf-8'))


    #指定 lxml 作為解析器
    soup = BeautifulSoup(driver.page_source, features='lxml')

    # <tbody id='obstime'> 抓過去24小時資料
    tbody = soup.find('tbody',{'id':'obstime'})

    # <tbody>内所有<tr>標籤
    trs = tbody.find_all('tr')

    # 使用datetime取得時間年分
    year = str(datetime.datetime.now().year)

    # #對list中的每一項 <tr>
    for tr in trs[:1]:
    #   取時間, <tr>內的<th>, <th>內為時間 月/日<br>時:分
        d = tr.th.text
        d = year + d
    #   字串轉為datetime格式
        # date.append
        try:
            data.append(str(datetime.datetime.strptime(d, '%Y%m/%d %H:%M')))
        except Exception as e:
            print('get error.')
        # temp.append
        try:
            data.append(tr.find('td',{'headers':'temp'}).text)
        except Exception as e:
            print('get error.')# weather.append
        try:
            data.append(tr.find('td',{'headers':'weather'}).find('img')['title'])
        except Exception as e:
            print(e)# wind_direction.append
        try:
            data.append(tr.find('td',{'headers':'w-1'}).text)
        except Exception as e:
            print('get error.')# wind_speed.append
        try:
            data.append(tr.find('td',{'headers':'w-2'}).text)
        except Exception as e:
            print('get error.')# gust_wind.append
        try:
            data.append(tr.find('td',{'headers':'w-3'}).text)
        except Exception as e:
            print('get error.')# visible.append
        try:
            data.append(tr.find('td',{'headers':'visible-1'}).text)
        except Exception as e:
            print('get error.')# hum.append
        try:
            data.append(tr.find('td',{'headers':'hum'}).text)
        except Exception as e:
            print('get error.')# pre.append
        try:
            data.append(tr.find('td',{'headers':'pre'}).text)
        except Exception as e:
            print('get error.')# rain.append
        try:
            data.append(tr.find('td',{'headers':'rain'}).text)
        except Exception as e:
            print('get error.')# sunlight.append
        try:
            data.append(tr.find('td',{'headers':'sunlight'}).text)
        except Exception as e:
            print('get error.')
    time.sleep(10)
    # print(data)
    data.clear()
    
#關閉模擬瀏覽器       
driver.quit()
# ---------------------------------------------------------------
# import pandas as pd

table = {
"觀測時間":date,
"溫度(°C)":temp,
"天氣":weather,
"風向":wind_direction,
"風力 (m/s)":wind_speed,
"陣風 (m/s)":gust_wind,
"能見度(公里)":visible,
"相對溼度(%)":hum,
"海平面氣壓(百帕)":pre,
"當日累積雨量(毫米)":rain,
"日照時數(小時)":sunlight
}
# df = pd.DataFrame(table)
# df = df.reset_index(drop=True)    
# df.to_csv(( region + '.csv'), encoding = 'utf-8')