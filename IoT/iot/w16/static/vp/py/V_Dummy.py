#This 檔案 uses UTF-8  VPython Dummy_Device by tsaiwn@cs.nctu.edu.tw
#  coding=utf-8

#from vpython import *   # 單機版才要 (1), 要當 IoTtalk VPython DA 請註解掉
## 單機版 offline 還要打開後面的 test( ); 會根據 iottalk 是 False 打開
### .. 把以下 iottalk 設 False;  這樣後面也不會做 dai(profile) !
iottalk = True    # using IoTtalk ?  (2)  ==> has sound to play
#scene.autoscale = False   # 看要不要讓場景遠近 AutoScale; 預設是 True
#from time import sleep   # VPython 已經有 sleep;;  Edutalk 也是
#from random import random  # VPython 已經有 random()

runLimit = 3   # 0 表示不會停止
speed = 0.88 #   球的 移動速度 
freq = 60   # 每秒 Loop 幾次 (frame rate)  # 120   # 1000
randSpeedCycle = 2.5 #  2.5 seconds to change Speed 亂數絕定速度
rscCount = int(freq * randSpeedCycle * 0.99)
isControl = False # 還沒參數送進來過 or 沒被重新啟動 by -5566
radius = 0.58
height = radius + 0.1
bbSpeed = speed
t = 0        # 時間
dt = 1.0 / freq
freq10 = int(freq/10)
  
fLong = 33  # 木塊長
fWide = 12  # 木塊寬
fThick = 0.25
isRunning = True
humidity = 58        #  初始濕度, 只是為了 gdots ( )畫圖 
##
## iottalk 要把以下兩個 def 都註解掉; 單機版則要打開

"""     ###   單機版注意 (3) 
#  單機版沒聲音, 因它不認識這兩函數, 幫它定義!
def preloadAudio(name):
    return
def playAudio(name):
    return
"""     ###   單機版注意 (4) 

## Note 注意往下第六列  (inpFst, *_) =  ... 給單機版用 
def getInpFst(inp):      # 故意寫在較前面方便修改切換 IoTtalk 版 <==> VPython 單機版 
    if inp != str(inp):     # 終於想到這招來查看是否輸入字串 or scalar 阿不然一堆函數都不給用!
        return inp    # inp 可能是整數或實數, 不是字串
    if iottalk:  # GlowScript 用 舊版本 Python ?!
        splitStr = inp.split(" ")    #  含有字串, 取最左邊 token 
        inpFst = splitStr[0]
    if not iottalk:  #  單機版用 Python 的 split( ) 
        pass   # 單機版請打開以下 有 (inpFst, *_) = ... 的; 單機版注意 (5) 是最後要注意項目
        # (inpFst, *_) = inp.split(maxsplit=1);  #  (5) 在 iottalk 還是要註解掉否則會翻譯錯誤!!! 
    return inpFst
#
preloadAudio('Startup.wav')
preloadAudio('chord.wav')
preloadAudio('gj.wav')

def scene_init():
    global scene, ball, bb, floor, gd, xt,vt, hd, c
    global label_info, inp_info, dm_info, chk_info, ch2_info
    scene =  canvas(title="Dummy_Device by tsaiwn@cs.nctu.edu.tw", width=800, height=500, x=0, y=0,
         center = vector(0, 15, 0),    # center=vec(0, 0.1, 0),
         background=vec(0, 0.6, 0.6))
    ball = sphere( pos = vec(0, height, 0), radius = radius, color = color.green,
           velocity = vector(0,0,0), visible = True)
    bb = sphere( pos = vec(0, height, -5), radius = radius, color = vec(255/255,51/255,204/255),
           velocity = vector(0,0,0), visible = True)
    floor = box(pos=vec(0, 0, 0), length=fLong, height=fThick, width=fWide,
        texture=textures.wood)
    gd = graph(title="x-t plot", width=600, height=450,
       x=0, y=988, xtitle="t(s)", ytitle="y Blue=position; pink=speed")
    #gd2 = graph(title="another figure", width=600, height=450, ... 可以另一張圖..
    xt = gcurve(graph=gd, color=color.blue, label='position')
    vt = gcurve(graph=gd, color=vec(255/255,51/255,204/255), label='速度')
    hd = gdots(graph=gd, color=color.green, radius=0.88, label='濕度')
    label_info = label( pos=vec(5,25,-5), text="", color = color.yellow, height=18)
    inp_info = label( pos=vec(5,30,-5), text="", color = color.yellow, height=18)
    dm_info = label( pos=vec(-33,38,-16), text="Dummy_Device", color = color.white, height=24)
    chk_info = label( pos=vec(-28,10,-8), text="chk", color = color.yellow, height=18)
    ch2_info = label( pos=vec(-28,5,-8), text="ch2", color = color.white, height=18)
    c = curve(pos=[vec(-17,10,0), vec(-15,10,0)], color=color.red, radius=0.1)

v1=vec(0,10, 0)  # for gcurve  c.append(v1, v2) 
v2=vec(0,10, 0)
##
def checkbbPos( ):
    global bb
    if (bb.pos.x >= fLong/2 - 0.5* radius):
        bb.pos.x = - fLong/2 + 0.5* radius;
        
def changeSpeed():
    global speed,isControl
    if isControl: return
    speed = speed -0.38 + random( ) * 2   # VPython 已經有 random( ) 
    if(speed > 5):
        speed = 0.38
    
ggyy=0
def setRandSpeed( ):        # 亂數變化速度; 順便改 濕度 
    global speed, ggyy, humidity
    # rate(1,setRandSpeed)   # 只有 Edutalk 內可以這樣 !?
    ggyy += 1
    if ggyy == int(rscCount/2): humidity += int(random( )*20-10) # 隨便亂數變化濕度:-) 
    if ggyy < rscCount:
        return
    ggyy = 0
    changeSpeed( )

def drawCurve( ):
    global v1, v2, speed, c, hd    # 順便 plot 出濕度 hd.plot( )
    v2.x = ball.pos.x
    v2.y = 10+speed   # adjust
    c.append(v1, v2)   #   從 v1 畫到 v2 
    hd.plot( t, humidity);  #  濕度 [0..100] 
    if (v2.x < -5) and (v1.x > 5):   # right to left draw
        c.clear( )
    v1.x = v2.x
    v1.y = v2.y
##
uuyyy = 0
def update_info():
    global uuyyy, label_info, inp_info
    uuyyy += 1
    if uuyyy < freq10: return
    uuyyy = 0
    label_info.text =  "Speed: {:.2f}\nPosition: {:.2f}\nTime: {:.2f}". \
         format(speed, ball.pos.x, t)
    inp_info.text =  "Got data: {} ".format(inp)
    #rate(11, update_info)

def restart( ):
    global saveX
    ball.pos.x =  -(fLong*0.9/2)  # 幾乎最左邊
    bb.pos.x = -(fLong*0.9/2)  # 幾乎最左邊
    saveX = ball.pos.x
    v1.x = ball.pos.x
    v2.x = ball.pos.x
    c.clear( )

def tryCMD(inp):
    global isRunning, howManyRun, saveX
    ans = True
    if inp == "reset" or inp == "restart":
        restart( ); return ans;
    if inp == "pause" or inp == "stop" or inp == "p" or inp == "s":
        saveX = ball.pos.x 
        isRunning = False;
        return ans
    if inp == "go" or inp == "cont" or inp == "continue" or inp == "c":
        if isRunning:
            pass
        else:
            ball.pos.x = saveX
            if howManyRun == 0: howManyRun = runLimit
            isRunning = True
            playAudio('chord.wav')    #  playAudio('go.wav') 
        return ans
    return False
## 當 Dummy_Control 收到新值時
inp = "No Data yet"
saveX = 0
def Dummy_Control(data):
    global inp, isControl, speed, ball, bb, v1, v2, c, saveX
    global chk_info, ch2_info, saveX, isRunning
    if data == None:
        return
    inp = data[0]
    isControl = True
    if tryCMD(inp):  # 處理了命令 go, pause, reset
        return    # 已處理了命令
    inpFst = getInpFst(inp)  # obtain inpFst; 繼續處理 inp 
    chk_info.text = inp     # for Debug
    ch2_info.text = inpFst     # for Debug
    kk = -32768
    try:
        kk = float(inpFst)  # try to get first number 
    except:    # ## 其實我可以在這except 之上, kk = 之下, 下一句放如 gyg = 38 後面檢查gyg
        pass
        return   # 可惡, VPython (Glowscript) 不產生 exception (類似 C語言) 
    # import math   # 還亂改 kk 給我放 NaN; 又沒 math. 也沒 isdigit( ), ord( ) 等
    kkCode = "{:.2f}".format(kk)
    if kkCode == "NaN":    ## float("nan") :  # 終於用這招 kkCode 抓到 NaN :-)
        return
    if kk != -32768:  # has a number  #其實這檢查 -32768 已經沒用了 :-) 
        if kk > 5555:
            isControl = False     # 表示亂數絕定速度 speed
            return
        if kk < -5000:      # 表示 "reset" position
            restart( );
            return
        if kk < -5 : kk = -5
        if kk > 5: kk = 5
        speed = kk
        isRunning = True   # 有改變速度阿就讓它動

tttyyy = 0
def test( ):  #  單機版用來 offline 測試 !
    global tttyyy
    tttyyy = 1 + tttyyy
    if tttyyy == 5*freq:    # 5 秒後
        Dummy_Control(["haha haha hello"])
    if tttyyy == 8*freq:    # 8 秒後 
        Dummy_Control(["3.25 Change SP 改速度 3.25 有看到嗎"])
    if tttyyy == 18*freq:
        Dummy_Control(["2.58 又 Change SP 改速度 2.58"])
    if tttyyy == 21*freq:
        Dummy_Control(["-5555 Now Reset 位置"])
    if tttyyy == 26*freq: 
        Dummy_Control(["5566 Now 恢復亂數控制 speed 速度"])
##
def setup( ):
    scene_init()
    setRandSpeed( );
    profile = {
        'dm_name' : 'Dummy_Device',
        'odf_list' : [ Dummy_Control ],   # df_list  vs. odf_list 
    }
    if iottalk:
        dai(profile)  #  若 單機版, 離線測試沒 dai( ) 可用 
    update_info()
    playAudio('Startup.wav')

setup( )
ball.pos.x = -(fLong*0.9/2)  # 幾乎最左邊
bb.pos.x = -(fLong*0.9/2)  # 幾乎最左邊
#print("ball pos:", ball.pos)
howManyRun = runLimit     # 要跑幾趟 --　每次到最右邊算一趟
v1.x = ball.pos.x
v2.x = ball.pos.x
v1.y=10
v2.y = 10+speed
# sleep(3)  # 如果單機版想先 delay 一下 
left = - fLong/2 + 0.5* radius;   # 左邊緣
right = fLong/2 - 0.5* radius;     # 右邊緣

while True:
    if not iottalk:  #  offline 測試; 相當於註解掉
        test( )     ##  offline 測試; 相當於註解掉  
    update_info()
    setRandSpeed( );
    rate(freq)
    if not isRunning:
        continue     #  go to while True 
    checkbbPos( );   # 對照球 (粉紅) 位置可能需要調整
    if speed < 0 and (ball.pos.x <= left):  # too Left
        isRunning = False
        speed = 0
        saveX = ball.pos.x
        playAudio('chord.wav')   # 可換別的聲音 
        continue     #  go to while True 
    if speed > 0 and (ball.pos.x >= right):  # 到最右邊了
        howManyRun -= 1      # 每次到最右邊算一趟 
        if howManyRun == 0:
            isRunning = False  # break;   #  若要停止則 break
            saveX = left;  # 稍後會 ..移至最左 Left Side 
            continue     #  go to while True 
        ball.pos.x = left; 
        playAudio('chord.wav')
    ball.pos.x += speed * dt
    bb.pos.x += bbSpeed * dt
    xt.plot(pos = (t, ball.pos.x))
    bvx =  3 * speed   # 放大三倍, 因 Y 軸 scale 被 xt (ball.pos) 掌控了
    vt.plot(pos = (t, bvx))
    drawCurve( )
    t += dt

print("Bye, time = ", t)
sleep(0)  # 讓一下 CPU :-)