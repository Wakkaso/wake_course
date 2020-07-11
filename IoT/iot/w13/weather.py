# DAI2.py #coding=utf-8 -- new version of Dummy Device DAI.py, modified by tsaiwn@cs.nctu.edu.tw
# you can get from here:  https://goo.gl/6jtP41   ; Search dummy + iottalk  for other files
import time, DAN_W, requests, random 
import threading, sys # for using a Thread to read keyboard INPUT

# ServerURL = 'http://Your_server_IP_or_DomainName:9999' #with no secure connection
# ServerURL = 'http://192.168.20.101:9999' #with no secure connection
#  注意你用的 IoTtalk 伺服器網址或 IP 
ServerURL = 'https://5.iottalk.tw' # with SSL secure connection
# ServerURL = 'https://Your_DomainName' #with SSL connection  (IP can not be used with https)
Reg_addr = None #if None, Reg_addr = MAC address #(本來在 DAN.py 要這樣做 :-) 
# Note that Reg_addr 在以下三句會被換掉! # the mac_addr in DAN.py is NOT used
mac_addr = 'C860008D238' + str( random.randint(100,999 ) )  # put here for easy to modify :-)
# 若希望每次執行這程式都被認為同一個 Dummy_Device, 要把上列 mac_addr 寫死, 不要用亂數。
Reg_addr = mac_addr   # Note that the mac_addr generated in DAN.py always be the same cause using UUID !

DAN_W.profile['dm_name']='055_WD'   # you can change this but should also add the DM in server
DAN_W.profile['df_list']=['55.1','55.2','55.3','55.4','55.5','55.6','55.7','55.8','55.9','55.10','55.11']   # Check IoTtalk to see what IDF/ODF the DM has
DAN_W.profile['d_name']= "wakka."+ str( random.randint(100,999 ) ) +"_"+ DAN_W.profile['dm_name'] # None
DAN_W.device_registration_with_retry(ServerURL, Reg_addr) 
print("dm_name is ", DAN_W.profile['dm_name']) ; print("Server is ", ServerURL);
# global gotInput, theInput, allDead    ## 主程式不必宣告 globel, 但寫了也 OK
gotInput=False
theInput="haha"
allDead=False

def doRead( ):
    return;
    global gotInput, theInput, allDead
    while True:
        if gotInput:
           time.sleep(0.1)
           continue  # go back to while
        try:
           begin = 1
        except Exception:    ##  KeyboardInterrupt:
           allDead = True
           print("\n\nDeregister " + DAN_W.profile['d_name'] + " !!!\n",  flush=True)
           DAN_W.deregister()
           sys.stdout = sys.__stdout__
           print(" Thread say Bye bye ---------------", flush=True)
           sys.exit( );   ## break  # raise   #  ?
        gotInput=True
        if theInput !='quit' and theInput != "exit":
           print("Will send " + theInput, end="   , ")

#creat a thread to do Input data from keyboard, by tsaiwn@cs.nctu.edu.tw
threadx = threading.Thread(target=doRead)
threadx.daemon = True
threadx.start()

while True:
    try:
        from bs4 import BeautifulSoup
        from selenium import webdriver
        import datetime
        import time

        data = []

        region = 'Hsinchu'
        #新竹測站觀測資料
        url = 'https://www.cwb.gov.tw/V8/C/W/OBS_Station.html?ID=46757'

        #啟動模擬瀏覽器
        driver = webdriver.Chrome()

        #取得網頁代碼
        driver.get(url)
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
                print(e)
            # temp.append
            try:
                data.append(float(tr.find('td',{'headers':'temp'}).text))
            except Exception as e:
                print(e)# weather.append
            try:
                data.append(tr.find('td',{'headers':'weather'}).find('img')['title'])
            except Exception as e:
                print(e)# wind_direction.append
            try:
                data.append(tr.find('td',{'headers':'w-1'}).text)
            except Exception as e:
                print(e)# wind_speed.append
            try:
                data.append(float(tr.find('td',{'headers':'w-2'}).text))
            except Exception as e:
                print(e)# gust_wind.append
            try:
                data.append(float(tr.find('td',{'headers':'w-3'}).text))
            except Exception as e:
                print(e)# visible.append
            try:
                data.append(tr.find('td',{'headers':'visible-1'}).text)
            except Exception as e:
                print(e)# hum.append
            try:
                data.append(float(tr.find('td',{'headers':'hum'}).text))
            except Exception as e:
                print(e)# pre.append
            try:
                data.append(float(tr.find('td',{'headers':'pre'}).text))
            except Exception as e:
                print(e)# rain.append
            try:
                data.append(float(tr.find('td',{'headers':'rain'}).text))
            except Exception as e:
                print(e)# sunlight.append
            try:
                data.append(float(tr.find('td',{'headers':'sunlight'}).text))
            except Exception as e:
                print(e)
        for idx in range(11):
            time.sleep(1)
            DAN_W.push('55.'+str(idx+1), data[idx], data[idx])
        data.clear()
        driver.quit()
        time.sleep(30)
    except Exception as e:
        pass
        # print(e)
        if str(e).find('mac_addr not found:') != -1:
            #print('Reg_addr is not found. Try to re-register...')
            DAN_W.device_registration_with_retry(ServerURL, Reg_addr)
        else:
            #print('Connection failed due to unknow reasons.')
            time.sleep(1)    
    try:
       time.sleep(0.2)
    except KeyboardInterrupt:
       break
time.sleep(0.5)
try: 
   DAN_W.deregister()
except Exception as e:
   print("===")
print("Bye ! --------------", flush=True)
sys.exit( );
