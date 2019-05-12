#coding=utf-8
import smtplib
from email.mime.text import MIMEText
from email.utils import formataddr
from config import Email_user,Email_pass,Email_host,Email_port,Email_value,Email_title,Email_from,Email_to

'''
未读信封邮件提醒
'''

def send_mail(user_mail):
    try:
        msg=MIMEText(Email_value,'plain','utf-8')
        msg['From']=formataddr([Email_from,Email_user])
        msg['To']=formataddr([Email_to,user_mail])
        msg['Subject']=Email_title
        server=smtplib.SMTP_SSL(Email_host, Email_port)
        server.login(Email_user, Email_pass)
        server.sendmail(Email_user,[user_mail,],msg.as_string())
        server.quit()
    except Exception:
        pass