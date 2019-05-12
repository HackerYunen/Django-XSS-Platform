import re

def XSS_filter(value):                                              #XSS检测
    black_list = '^[\<\>]+$'
    if re.match(black_list,value):
        return False
    return True

def Mail_check(value):                                              #邮箱格式检测
    pattern = '^[0-9a-zA-Z]+\@([0-9a-zA-Z]+\.)+[0-9a-zA-Z]+$'
    if re.match(pattern,value):
        return True
    return False

def Method_check(request,method):                                   #请求方式检测
    if request.method==method:
        return True
    return False

def Value_check(*args):                                             #检测数据是否为空
    for x in args:
        if x is None or x == '':
            return False
    return True