# DAI2.py #coding=utf-8 -- new version of Dummy Device DAI.py, modified by tsaiwn@cs.nctu.edu.tw
import time, DAN, requests, random 
import threading, sys # for using a Thread to read keyboard INPUT

# ServerURL = 'http://Your_server_IP_or_DomainName:9999' #with no secure connection
#  注意你用的 IoTtalk 伺服器網址或 IP  #  https://goo.gl/6jtP41
ServerURL = 'https://5.iottalk.tw' # with SSL secure connection
# ServerURL = 'https://Your_DomainName' #with SSL connection  (IP can not be used with https)
Reg_addr = None #if None, Reg_addr = MAC address #(本來在 DAN.py 要這樣做 :-) 
# Note that Reg_addr 在以下三句會被換掉! # the mac_addr in DAN.py is NOT used
mac_addr = 'CD8600D38' + str( random.randint(100,999 ) )  # put here for easy to modify :-)
# 若希望每次執行這程式都被認為同一個 Dummy_Device, 要把上列 mac_addr 寫死, 不要用亂數。
Reg_addr = mac_addr   # Note that the mac_addr generated in DAN.py always be the same cause using UUID !
DAN.profile['dm_name']='Dummy_Device'   # you can change this but should also add the DM in server
DAN.profile['df_list']=['Dummy_Sensor', 'Dummy_Control']   # Check IoTtalk to see what IDF/ODF the DM has
DAN.profile['d_name']= "TWN_D."+ str( random.randint(100,999 ) ) +"_"+ DAN.profile['dm_name'] # None
DAN.device_registration_with_retry(ServerURL, Reg_addr) 
print("dm_name is ", DAN.profile['dm_name']) ; print("Server is ", ServerURL);
# global gotInput, theInput, allDead    ## 主程式不必宣告 globel, 但寫了也 OK
gotInput=False
theInput="haha"
allDead=False

def doRead( ):
    global gotInput, theInput, allDead
    while True:   
        while gotInput:   # 老闆還沒把資料拿走
           time.sleep(0.1)    # 小睡 下把 CPU 暫時讓給別人
           continue  # go back to while   
        try:     # 準備讀取資料, 注意程式會卡在這等 User 輸入, 所以要用 Thread
           theInput = input("Give me data: ")
        except Exception:    ##  KeyboardInterrupt:
           allDead = True
           print("\n\nDeregister " + DAN.profile['d_name'] + " !!!\n",  flush=True)
           DAN.deregister()
           sys.stdout = sys.__stdout__
           print(" Thread say Bye bye ---------------", flush=True)
           sys.exit( );   ## break  # raise   #  ?
        if theInput =='quit' or theInput == "exit":    # these are NOT data
           allDead = True
        else:
           print("Will send " + theInput, end="   , ")
           gotInput=True   # notify my master that we have data 
        if allDead: break;   # 離開 while True 這 Loop  

#creat a thread to do Input data from keyboard, by tsaiwn@cs.nctu.edu.tw 
threadx = threading.Thread(target=doRead)
threadx.daemon = True
threadx.start()

while True:
    try:
        if(allDead): break;
    #Pull data from a device feature called "Dummy_Control"
        value1=DAN.pull('Dummy_Control')
        if value1 != None:
            print (value1[0])
    #Push data to a device feature called "Dummy_Sensor" 
        #value2=random.uniform(1, 10)    ## original Dummy_Device example
        if gotInput:
           # we have data in theInput
           try:
              # value2=float( theInput )
              value2= theInput 
           except:
              value2=0
           if(allDead): break;
           gotInput=False   # so that you can input again 
           DAN.push ('Dummy_Sensor', value2,  value2)  #  試這:  DAN.push('Dummy_Sensor', theInput) 

    except Exception as e:
        print(e)
        if str(e).find('mac_addr not found:') != -1:
            print('Reg_addr is not found. Try to re-register...')
            DAN.device_registration_with_retry(ServerURL, Reg_addr)
        else:
            print('Connection failed due to unknow reasons.')
            time.sleep(1)    
    try:
       time.sleep(0.2)
    except KeyboardInterrupt:
       break
time.sleep(0.25)
try: 
   DAN.deregister()    # 試著解除註冊
except Exception as e:
   print("===")
print("Bye ! --------------", flush=True)
sys.exit( );
