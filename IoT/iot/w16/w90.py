#This 檔案 w90.py  uses UTF-8  ## coding=utf-8   
myPort = 80
## 請在這檔案的目錄建立兩個子目錄: static 和 templates   (注意最後有 s)
from flask import Flask, request
from flask import render_template, redirect, send_file
app =Flask(__name__)

import socket
myhost = socket.gethostname()     # myhost 要給 HTML 內的 myname (故意)
myip = socket.gethostbyname(myhost)    # 通常名字與 HTML 內相同比較不會搞混 ! 

@app.route("/")
def webRoot( ):
   try:     # 注意 index.html 內要用的是 {{myname}}  和 {{myip}} 
      # return render_template('index.html')  ## 如果沒用到 Jinja2 template
      return render_template('index.html', myname=myhost, myip=myip) 
   except:
      return "<h1 style='color:red;'>No index.html in templates.</h1>", 404 

import os
from flask import send_from_directory
@app.route("/favicon.ico")
def favicon( ):
   try:
       return send_from_directory(os.path.join(app.root_path, 'static/img'),
             'myicon.png', mimetype='image/vnd.microsoft.icon')
   except: 
       return "No /static/img/myicon.png", 403  #故意用 403 (FORBIDDEN)

# 注意瀏覽器的網址列要用 127.0.0.1 或你的 IP,  不是打 0.0.0.0 喔! 後面打 :port
app.run( '127.0.0.1' , port=myPort, debug=True)   # 如 port 是 80 則可不用打 :80