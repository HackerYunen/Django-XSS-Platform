from django.contrib import auth
from django.contrib.auth.models import User
from config import Safe_code
from .filter import Value_check

def login(request):                                                             #登录
    username = request.POST.get('username')
    password = request.POST.get('password')
    safecode = request.POST.get('safecode')
    if not Value_check(username,password,safecode):                             #检查字段完整
        return '请检查字段是否填写完整'
    elif safecode != Safe_code:
        return '安全秘钥错误'
    try:
        check = auth.authenticate(username=username,password=password)
        if check is None:
            return '账号或密码错误'
        auth.login(request,check)
        return 'True'
    except:
        return '登录错误'

def register(request):                                                           #注册
    username = request.POST.get('username')
    password = request.POST.get('password')
    email = request.POST.get('email')
    safecode = request.POST.get('safecode')
    if not Value_check(username,password,safecode,email):                        #检查字段完整
        return '请检查字段是否填写完整'
    elif safecode != Safe_code:
        return '安全秘钥错误'
    try:
        User.objects.create_user(username=username,password=password,email=email)
        return 'True'
    except:
        return '注册失败，请更换用户名或邮箱重试'

def logout(request):                                                            #登出
    auth.logout(request)

def change_pass(request):                                                       #修改密码
    username = request.user.username
    oldpass = request.POST.get('oldpass')
    newpass = request.POST.get('newpass')
    if not Value_check(oldpass,newpass):
        return '请检查字段是否填写完整'
    user_info = auth.authenticate(username=username,password=oldpass)
    if user_info is not None:
        user_info.set_password(newpass)
        user_info.save()
        return 'True'
    return '原密码填写错误，请重新填写'