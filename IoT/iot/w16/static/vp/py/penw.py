#This 檔案 uses coding: utf-8 ;;; 新版 class Pendulum; modified by tsaiwn@cs.nctu.edu.tw
## #** 王一哲老師的蛇擺放入 Edutalk 的自由落體實驗, 可用手機控制參數 num 和 N

"""
VPython教學進階內容: 蛇擺 pendulum wave, 使用 class
 Ver. 1: 2018/7/12
 Ver. 2: 2018/7/14 加上計時器
 作者: 王一哲 
"""
pendulums = []

## whn run in GlowScript or /withOUT EDUtalk, enable next 3 functions
# def playAudio(gg): return   # for run without Edutalk/IoTtalk
# def dai(gg): return   # for run without Edutalk/IoTtalk
#from vpython import *          # 單機版需要這句

"""
 1. 參數設定, 設定變數及初始值
"""
num = 35            # 單擺的個數
N = 15              # 週期最長的單擺在蛇擺的1個週期內擺動的次數
dfc = 5    # [0, 999]  # 阻力係素 ; 設 0 就當作真空不會停止 #damping force
## 以上當作可改的參數

angle=30     # 擺角
stopPoint = radians(0.1)   #  stop when smaller than 0.1 degree
isRunning = True

freq = 1000
dt =  1.0/freq         # 時間間隔
rcff = dfc/1000  # 方便看; 後來改印 dfc 整數; 阻尼係素由 dfc * scaleDFFA 決定
scaleDFFA = 0.0005
dfFactor = 1 - scaleDFFA * dfc    # 真正用這乘, dfFactor 相當於恢復係素
# dfFactor = 0.975   #  1.0 表示沒有空氣阻力 
g = 9.8             # 重力加速度
Tpw = 30         # 蛇擺的週期
Tmax = Tpw / N      # 週期最長的單擺擺動週期
Lmax = Tmax**2 * g / (4 * pi**2)   # 週期最長的單擺擺長 
width = Lmax        # 將畫面邊長設定為最長的單擺擺長
m = 1               # 小球質量
size = width / (2 * num)         # 小球半徑; # 但之後若 num 改變也不更改 size
theta000 = radians(angle)# 起始擺角, 用 radians 將 deg 單位換成 rad 弳度量
theta0 = theta000
i = 0               # 小球經過週期次數
t = 0               # 時間
pendulums = [ ]

def changeDfc(gg):
    global dfc, rcff, dfFactor
    dfc = int(gg)
    if dfc > 999: dfc = 999    # 避免立即停掉
    if dfc < 0: dfc = 0    # 防呆
    rcff = dfc/1000   # 方便看; 不過後來這 rcff 已經沒用!
    dfFactor = 1 - scaleDFFA * dfc    # 真正用這乘, 讓擺角越來越小 (模仿空氣阻力)

# Pendulum class in pen.py
# Filename: pen.py    ## coding: utf-8
# Usage: from pen import *

# from vpython import *     ##  IoTtalk VPDA 這句要註解掉!

## pi is defined in vpython

# 新增類別 Pendulum, 輸入週期T, 懸掛位置loc, 編號idx, 自動產生小球及對應的繩子
# 設定方法 update, 輸入經過的時間dt, 更新單擺狀態
class Pendulum:   
    __theta0 = radians(10);    ##  shared variable; 左邊寫 __ 表示 private 藏起來
    __dfFactor = 1;   ## 同類別各物件共用; 模仿阻尼係素 (減振係素) 
    g = 9.8  # public variable, 沒保護; 就是外部可以 Pendulum.g = new_value 
    m = 1 
    def getTheta0( self):    ## getter ; 因為 __ 開頭是 private, 須提供函數讓外部讀取 
        return Pendulum.__theta0 
    def setTheta0(arg):   # setter   # 讓外部可透過這 函數修改 __theta0
        Pendulum.__theta0 = arg
    def setDfFactor(arg):  ## 注意 __dfFactor 也是藏起來的 shared 變數; 提供 setter 才能改
        Pendulum.__dfFactor = arg
    def  __del__(self):   # delete inner components
        self.ball.visible = False   # 先設為看不見, 再砍了它才有用
        self.rope.visible = False
        del self.ball   # 砍 !!! 先設為看不見, 再砍了它才有用
        del self.rope  
    def __init__(self, T, loc, idx, num, width, size):
        self.T = T
        self.loc = loc
        self.idx = idx
        self.width = width     
        self.L = self.T**2 * Pendulum.g / (4 * pi**2)   # pi is in vpython module 
        self.I = Pendulum.m * self.L**2
        self.alpha = 0    ## angular acceleration
        self.omega = 0    ## angular velocity
        self.theta = Pendulum.__theta0    # 使用 Pendulum  之前 要先把 theta0 設定好 !
        self.ball = sphere(pos=vec(self.loc, width/2 - 
                     self.L*cos(Pendulum.__theta0),  self.L*sin(Pendulum.__theta0)), 
                        radius=size, color=vec(1 - self.idx/num, 0, self.idx/num))
        self.rope = cylinder(pos=vec(self.loc, width/2, 0), 
                       axis=self.ball.pos - vec(self.loc, width/2, 0),
                       radius=0.1*size, color=color.yellow)
    def update(self, dt):
        self.dt = dt      ## 其實直接用 dt 即可不必記住這
        ##self.alpha = -Pendulum.m*Pendulum.g*self.ball.pos.z/self.I   # angular acceleration
        self.alpha = -Pendulum.g/self.L * sin(self.theta)    # angular acceleration
        pomg = self.omega;   ## previous omega ## 之前角速度; 往右 > 0; 往左小於 0
        self.omega += self.alpha*self.dt    ## angular velocity
        if self.idx==0 and pomg * self.omega < 0:   ##  negative / positive velocity
            Pendulum.__theta0 *= Pendulum.__dfFactor   ##  由第 0 個負責縮減 theta0
        # self.theta += self.omega*self.dt
        gg = self.theta + self.omega* dt    ## dt 是傳入的參數
        if gg > 0 and gg > Pendulum.__theta0:    # 模仿阻尼 + 防止因誤差導致越盪越高 !
            pass   # # for sometimes you want to comment out next line :-) 
            gg = Pendulum.__theta0
        if -gg > 0 and -gg > Pendulum.__theta0:
            pass
            gg =  - Pendulum.__theta0
        self.theta = gg    ## 限縮下次的擺角 
        self.ball.pos = vec(self.loc, 0.5*self.width - 
             self.L*cos(self.theta), self.L*sin(self.theta))
        self.rope.axis = self.ball.pos - vec(self.loc, 0.5*self.width, 0)
  
"""
 2. 畫面設定
"""
# 產生動畫視窗、天花板
scene = canvas(title="Pendulum Wave", width=600, height=600, x=0, y=0, background=color.black)
scene.camera.pos = vec(-1.5*width, 0.5*width, width)
scene.camera.axis = vec(1.5*width, -0.5*width, -width)
roof = box(pos=vec(0, (width + size)/2, 0), size=vec(width, size, 0.5*width), color=color.cyan)
timer = label(pos=vec(-0.58*width, 0.77*width, 0), text="t =  s", space=50, height=24,
              border=4, font="monospace")
para_info = label(pos=vec(0.9*width, 0.95*width, 0), space=30, height=24, 
    text="單擺的個數 num:\n最長單擺擺動次數 N:", color=color.yellow)
th0_info = label(pos=vec(-0.6*width, 0.65*width, 0), space=30, height=18, 
    text="theta0: ", color=color.yellow)

############################################################# 
def initPen(num ):  
  global pendulums
# 利用自訂類別 Pendulum 產生 num 個單擺
  pendulums = []
  for i in range(num):
    T = Tpw / (N + i)
    ddd=num-1     # 防止除以 0
    if ddd < 5: ddd = 5     # prevent from  divided by 0 when num == 1
    loc = width*(-0.5+(i/(ddd)))   ## ddd : at least has 5 NOW
    Pendulum.setTheta0(theta0)
    Pendulum.setDfFactor(dfFactor)     
    Pendulum.g = g
    Pendulum.m = m   
    pendulum = Pendulum(T, loc, i ,  num, width, size)
    pendulums.append(pendulum)

def resetGame( num):  
    global t, theta0, isRunning, pendulums
    t = 0
    theta0 = theta000    # initial theta
    isRunning = False   ## 避免我剛好砍了某單擺, 但主 thread 卻想去更新該單擺 
    #sleep(0.2)         # Edutalk VPython 在 main thread 之外不可以用 sleep
    for pendulum in pendulums:   ## 移除舊的擺球避免亂七八糟!
        pendulum.__del__( )   ## 砍掉內部物件 ball, rope ; 強制執行 
        del pendulum   ## delete the object ;發現 Edu VPython 沒自動做 __del__(self) 
    # import gc          # 這個在 Edutalk VPython 不能用 !
    # gc.collect()       ## 好像IoTtalk VPDA 也不能用？只有單機版可以用 !? 
    initPen( num)     # 重生 num 個 pendulum
    isRunning = True   # Let it go
    playAudio("Go.wav")
#######################################

# 當 Gravity 旋鈕/滑桿 收到新值時   # Ball-throw1 : Angle
def Angle(data):  
    global num      ## 單擺的個數 num
    if data != None:
        num = int( data[0] * 5 )   # [0, 10] ==> to [0, 50]
        if num < 1: num = 1
        resetGame(num)

# 當 Radius 旋鈕/滑桿 收到新值時     # Ball-throw1 : Height
def Height(data):  
    global N     ## N :  最長單擺擺動次數
    if data != None:
        N = int( data[0] * 3 )    # [0, 10] ==> to [0, 30]
        if N < 3: N = 3
        resetGame( num)

# 當 Speed 旋鈕/滑桿 收到新值時       # 先寫起來備用
def Speed(data):  
    global dfc       ## dfc :  阻尼係素 [0, 99]阻力係素 [0, 99]阻力係素 [0, 99]
    if data != None:
        changeDfc( data[0] )   # do  dfc = data[0]   # Damping Force coefficient
        resetGame(num )
## 
ucc = 0
def update_info( ):
    global ucc
    ucc += 1              
    ttt = int(freq / 10)      # 每秒更新 10 次 
    if ucc % ttt != 0: return                     
    #content = "t = " + str(int(t)) + " s"
    timer.text = "t = {:.1f} s".format(t)
    para_info.text =  \
    "單擺的個數 num = {:d}\n最長單擺擺動次數 N: {:d}\n模擬阻尼係素(0~99): {:d}".format(num, N, dfc)
    th0_info.text  =  "Theta0: {:.5f}".format(theta0)
    #rate(6, update_info)     # IoTtalk 的 VPython 不能用 (可能版本較舊); # 那就改寫成由 While Loop 不斷叫這個 !
# 
def setup( ):
    profile = {
        'dm_name' : 'Ball-throw1',     ## 這在 IoTtalk 上可自己建立 DM 或用 "Ball-throw1"
        'odf_list' : [Angle, Height, Speed],     # 注意是 df_list; 在 IoTtalk 是 odf_list
    }
    dai(profile)   # connect ro Edutalk   ( or  IoTtalk server ) 
    update_info( )   ## 調用 更新畫面文字的函數; 然後它自己會用 rate(6, 自己) 重複調用(可單機版不能用)
    playAudio("Go.wav")    # 播放聲音 "Go"    
#
def checkInp( ):         ## 單機 Python 版本會用到 
    pass

initPen(num)
setup( )
isRunning = True

while True:
    rate(freq)
    while not isRunning:   # wait till True
        sleep(0.2)
        checkInp( )
        continue
    for pendulum in pendulums:
        pendulum.update(dt)
    theta0 = Pendulum.getTheta0( )   # read back the theta0
    if theta0 <= stopPoint:     # angle too small
        isRunning = False    # 角度太小看不出來阿就不要動囉
        continue
    t += dt
    checkInp( )    # 預留單機版要查看鍵盤輸入
    update_info( )    ## ㄍㄥ新畫面文字信息