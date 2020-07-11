FarmDashboard
================================================================================

* `詳細安裝說明 <https://hackmd.io/5LqVk4MBSCinRXQderD_Jw>`_

* `Dashboard操作教學影片 <https://drive.google.com/drive/u/1/folders/13AyBQ-3m_RuPOW1J2aR1yD0svUKuEFdg>`_

***Field的名稱不可以包含特如符號如 . $ # & @ 等等，請使用全英文字母***

簡易安裝說明
----------------------------------------------------------------------

#. 安裝 MySQL >= 5.7 (注意1)
#. ``sudo pip3 install -r requirements.txt`` 安裝相關需要套件
#. 新增 MySQL 內的 user，允許連線 IP，與資料庫( `db_name` )，以及權限 (詳見下方注意2)
#. 修改 `config.py`，根據內部註解依序填上資料
#. 視情況修改 `db_init.json` (記得要設定 `admin` 密碼與 DB 初始 table 欄位)
#. 執行 ``python3 db.py init``  (注意3)
#. 安裝好 ``tmux``
#. 執行 ``bash startup.sh``  (注意4)

至此 Dashboard 已啟動完成，可用指令 ``tmux a`` 查看運行狀況
(按ctrl+b 1 / ctrl+b 2切換 dashboard 主程式與 DA 查看運行狀況)。

注意
----------------------------------------------------------------------



- ***注意1***: 安裝mysql時，常會遇到安裝過程中，完全沒問密碼，這表示以前曾經裝過mysql，或是裝過相關套件，這時就比需要重設密碼，執行下列指令進行重設，

    sudo mysqladmin -u root password

  Reference: https://emn178.pixnet.net/blog/post/87659567


- ***注意2***: ``mysql+pymysql://<user>:<pass>@localhost:3306/<db_name>?charset=utf8``
  其中的 ``db_name``，就是打算要建立的資料庫名稱，
  例如要給 Dashboard 用的，就取名為 ``dashboard``，該主表名稱不是隨便亂輸入的，
  通常是在db內建立 user 時，就順道建立一同名的 table，這樣最簡單
  (例如，假設使用 phpmyadmin 建立使用者時，就勾選 "建立與使用者同名的資料庫並授予所有權限。")，
  權限部分，如果不確定怎麼使用，就全開吧。所以 ``db_name`` 必須是已存在的資料庫，
  而不是隨便亂輸入的。
   
  然後，在建立使用者時，很高的機率會發生錯誤 
  "Your password does not satisfy the current policy requirements"，
  這時要去調降密碼強度限制，解決方法為連上mysql應用，使用如下指令後，
  就可以順利建立 user/table 了。

  執行 ``mysql -u root -p`` 打完密碼後進入 MySQL 命令列，然後執行下方指令::

        mysql> set global validate_password_policy=0;    
        mysql> exit
- 如果是遠端連線，要注意兩點 
    #. 要設定該使用者允許連線的 IP，沒去設定的話，絕對是連不上的
    #. 記得去掉設定檔內的 ``bind 127.0.0.1``

- ***注意3***: 然後要注意一下， ``python3 db.py init`` 只能執行一次。 (只會新加入，並不會抹除舊的資料，所以執行一次以上會錯誤)
  在MAC上面直接使用，在運行 ``python3 db.py init`` 時可能會遇到加密錯誤的錯誤訊息，這時需要安裝套件 cryptography


- ***注意4***: 在 Dashboard 上，只要 "新增/修改過 Field 的項目" 後，
  就要再次執行 ``bash startup.sh`` 更新 ``DA`` 狀態，
  不然 IoTtalk 將無法送資料到 Dashboard 上

