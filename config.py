# 网站配置项
Domain = 'http://127.0.0.1:8000/'
Open_register = True
Add_payload = True
Safe_code = 'ISA'

# C7短连接 APP KEY
App_open= True
App_key = ''

# 数据库配置
Mysql_host = '127.0.0.1'
Mysql_port = '3306'
Mysql_user = 'root'
Mysql_pass = 'root'
Mysql_db = 'xss'

# 默认Payload活性保持
Keep_open = True
Keep_time = 1                                                   #保持活性时长，单位h/小时

# 邮件提醒设置
Email_open = False
Email_user = ''
Email_pass = ''
Email_host = ''
Email_port = 465
Email_value = '您的外卖已送达，请登录平台查询订单'
Email_title = '您的外卖已送达，请登录平台查询订单'
Email_from = 'XSS平台'
Email_to = '顾客'

# Payloads设置
Payload_path = 'payloads/'
Replace_host = '<-|HOST|->'
Replace_id   = '<-|ID|->'