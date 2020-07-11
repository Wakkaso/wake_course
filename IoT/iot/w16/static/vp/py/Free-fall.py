# 物理參數區
# 實驗一修改處：第3~4行
height = 15.0     # 初始高度(m)
restitution = 1.0 # 恢復係數

# 模擬實驗參數區
freq = 120        # 更新頻率(Hz)
dt = 1.0 / freq   # 更新間隔(second)

# 與流程控制有關參數
# 實驗三修改處：第12行
g = 5.0          # 定義初始重力加速度

# 初始化場景
def scene_init():
    #initial scene 
    global scene, ball, floor, height, label_info
    scene = display(width=800, height=700, center = vector(0, height/2, 0), background=vector(0.5, 0.5, 0))
    floor = box(length=30, height=0.01, width=10, texture=textures.wood )
    ball = sphere(
        pos = vec(0, height, 0), 
        radius = 0.5, 
        color = color.green,
        velocity = vector(0,0,0),
        visible = True
    )
    label_info = label( pos=vec(10,20,0), text='', color = color.white)
                
# 當 Radius 旋鈕收到新值時        
def Radius(data):
    global ball
    if data != None:
        ball.radius = data[0]
        
# 當 Gravity 旋鈕收到新值時
def Gravity(data):
    global g
    if data != None:
        g = data[0]

# 每秒鐘更新顯示數據
def update_info():
    global label_info
    label_info.text='gravity: {:.2f}\nradius: {:.2f}\nspeed: {:.2f}\nheight: {:.2f}'.format(g,ball.radius,abs(ball.velocity.y),ball.pos.y)
    rate(1, update_info)

# 設定
def setup():
    scene_init()
    profile = {
        'dm_name' : 'Ball-Free-Fall',
        'odf_list' : [Gravity,Radius],
    }
    dai(profile)
    update_info()

setup()

while True:
    # 在每秒重畫 freq 次
    rate(freq)
    # 計算下一個時間點的資料並將改變畫出
    # 球的位置變化量是 速度 乘上 時間
    ball.pos = ball.pos + ball.velocity * dt
    # 判斷球的新位置是否高於地面
    if ball.pos.y > ball.radius:
        # 如是，依重力加速度修改速度
        ball.velocity.y = ball.velocity.y -g*dt
    else:
        # 如否，依恢復係數計算出反彈後速度，並設定球的位置在地面上
        ball.velocity.y = -ball.velocity.y * restitution
        ball.pos.y = ball.radius
