DEBUG = False

# use random string for your secret key,
# ex: "FDSDFGHksoyHisHtheHauthorHFDSWERE"
FLASK_SECRET_KEY = 'FDSDFGHksoyHisHtheHauthorHFDSWERE'

# DB_CONFIG = '<database>[+<orm_lib>]://[<user>[:<password>]]<host>[:<port>]/[db_name][?charset=utf8]'
# ex: DB_CONFIG = 'mysql+pymysql://user:pass@localhost:3306/db_name?charset=utf8'
# ex: DB_CONFIG = 'sqlite+pysqlite:///db.sqlite3'
DB_CONFIG = 'mysql+pymysql://dashboard:qwe123as@localhost:3306/dashboard?charset=utf8'
DB_POOL_RECYCLE = 600
DB_POOL_SIZE = 20
QUERY_LIMIT = 1
REQUEST_TIMEOUT = 10

# IoTtalk server's 'IP' or 'DomainName' only, without any protocol 'http://' or 'https://'.
# ex: '8.8.8.8' or 'google.com',
CSM_HOST = '5.iottalk.tw'

# For the demo page without login
# The data format is '<Field Name>':'<token>', examples are shown as follows.
demo_token = {
    'Field1': '65761609-0f1e-4b72-adcf-1ed092454d53',
}
