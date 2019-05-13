import time,base64,json
from .filter import XSS_filter
from .models import Letter,Project
from config import Email_open
from .email import send_mail
from django.contrib.auth.models import User
from .filter import Value_check

def get_victim_info_func(request):
    if request.method == 'GET':                                               #根据不同请求方式获取id、value
        project_id = request.GET.get('id')
        rev_value = request.GET.get('value')
        if not Value_check(project_id,rev_value):
            return '请检查字段是否完整'
    elif request.method == 'POST':
        project_id = request.POST.get('id')
        rev_value = request.POST.get('value')
        if not Value_check(project_id,rev_value):                              #兼顾json格式的post数据
            try:
                print(len(request.body))
                json_list = json.loads(request.body)
                project_id= json_list['id']
                rev_value = json_list['value']
                if not Value_check(project_id, rev_value):
                    return '请检查字段是否完整'
            except:
                return '请检查字段是否完整'
    else:
        project_id = ''
        rev_value = ''
    victim_time = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())        #取当前时间，并规定返回的格式
    victim_ip = request.META['REMOTE_ADDR']                                   #取ip
    victim_method = request.method                                            #取请求方式
    victim_UA = request.META['HTTP_USER_AGENT']                               #取UA头
    victim_referer = request.META['HTTP_REFERER']                             #取Referer头
    result = [project_id, rev_value, victim_time, victim_ip, victim_method, victim_referer, victim_UA]
    for x in range(0,len(result)):                                            #防止XSS爆菊，将含有<>的内容转成base64
        if not XSS_filter(result[x]):
            result[x] = base64.b64encode(result[x])
    return result

def rev_letter_func(request):
    try:
        result = get_victim_info_func(request)                                #读取请求中含有信息
        owner = Project.objects.get(project_id=result[0]).owner               #根据project_id取用户
        if Email_open:
            email = User.objects.get(username=owner).email                    #获取信封使用者Email
            send_mail(email)                                                  #发送Email
        Letter.objects.create(
            project_id=result[0],rev_value=result[1],
            time=result[2],ip=result[3],method=result[4],
            referer=result[5],ua=result[6],owner=owner,status='True')         #将信封存入数据库
    except:
        return 'Fail'
    return 'True'