from .models import *
import random,time
from .shorturl import url_to_short
from config import Domain,App_open


def rand_id():
    base_str = "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM"
    final_str = ""
    for x in range(10):
        final_str += base_str[random.randint(0,61)]                            #创建随机10位ID
    return final_str

def ajax_letter_value_func(username,letter_id):
    try:
        letter = Letter.objects.get(owner=username,id=letter_id)               #username防止越权查询
        letter.status='False'                                                  #修改状态为已读
        letter.save()
        return letter.rev_value
    except:
        return '禁止越权查看'

def ajax_delete_letter_func(username,letter_id):
    try:
        Letter.objects.get(owner=username,id=letter_id).delete()               #删除信封
        return 'True'
    except:
        return '禁止越权删除'

def ajax_delete_project_func(username,project_id):
    try:
        Project.objects.get(owner=username,project_id=project_id).delete()     #删除项目
    except:
        return '禁止越权删除'
    try:
        Letter.objects.get(owner=username,project_id=project_id).delete()      #删除项目信封
    except:
        pass
    return 'True'


def ajax_payload_explain_func(payload_name):
    try:
        explain = Payload.objects.get(name=payload_name).explain               #根据name查询payload的explain
        return explain
    except:
        return '查询失败'
                                                                               #添加项目
def ajax_add_project_func(username,name,describe,payload,send_email,diy_payload='',keep_alive='False'):
    project_id = rand_id()                                                     #生成随机十位ID
    payload_url = Domain + 'js?id=' + project_id
    if App_open == True:
        short_url = url_to_short(payload_url)                                  #短连接转换
    else:
        short_url = '未开启短链接服务'
    now_time = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())            #取当前时间，并规定返回的格式
    try:
        Project.objects.create(project_id=project_id,name=name,owner=username,
                               describe=describe,create_time = now_time,       #添加项目
                               payload = payload,send_email = send_email,
                               short_url = short_url,keep_alive = keep_alive,
                               diy_payload = diy_payload,)
        return 'True'
    except:
        return '添加失败，请检查字段内容'
