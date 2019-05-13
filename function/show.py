from config import Domain,Payload_path,Replace_host,Replace_id
from .models import *

def show_payload_func(project_id):
    try:
        p = Project.objects.get(project_id=project_id)                              #根据project_id取Project情况
        payload = p.payload                                                         #取payload名称
        if payload != 'diy':
            payload = Payload.objects.get(name=payload)
            filename = payload.filename
            parameter = payload.parameter
            file = open(Payload_path + filename,'r',encoding='utf-8')               #打开文件并读取
            value = file.read()                                                     #修改动态Payload
            value = value.replace(Replace_host,Domain).replace(Replace_id,
                                                               project_id)
            if parameter == '':
                return value
            p_list  = parameter.split('&')
            p_dic   = {}
            try:
                p_value = p.payload_parameter.split('&')                            #自定义参数处理
                for x in p_value:
                    p_list2 = x.split('=')
                    p_dic[p_list2[0]]=p_list2[1]
            except:
                return '自定义参数错误'
            for a in p_list:
                value = value.replace('<+|'+a+'|+>',p_dic[a])
        else:
            value = p.diy_payload                                                   #获取DIY_Payload
        return value
    except:
        return 'Error'

def show_index_number_func(username):
    try:
        user_letter = Letter.objects.filter(owner=username)                         #取用户信封情况
    except:
        user_letter = None
    try:
        letter_number = user_letter.count                                           #取用户信封总数
    except:
        letter_number = 0
    try:
        unread_letter_number = user_letter.filter(status='True').count              #取用户未读信封总数
    except:
        unread_letter_number = 0
    try:
        project_number = Project.objects.filter(owner=username).count               #取用户项目总数
    except:
        project_number = 0                                                          #定义返回字典
    result = {'letter_number':letter_number,
              'unread_letter_number':unread_letter_number,
              'project_number':project_number}
    return result

def show_index_payload_func():
    payload_list = Payload.objects.all()                                            #获取所有payload
    result = list(payload_list.values_list('id','name','explain'))                  #取特定字段并转换成列表
    return result

def show_payload_name_func():                                                       #获取所有payload名称
    payload_list = show_index_payload_func()
    payload_name_list = []
    for x in payload_list:
        payload_name_list.append(x[1])
    return payload_name_list

def show_table_project_func(username):
    project_list = Project.objects.filter(owner=username).order_by('-create_time')  #倒序获取用户的项目
    result = list(project_list.values_list('project_id','name','payload',
                                           'describe','create_time','short_url'))
    letter = Letter.objects.filter(owner=username)                                  #获取用户信封情况
    for x in range(0,len(result)):
        result[x]  = list(result[x])                                                #将元组转换成可编辑列表
        project_id = result[x][0]
        try:
            unread_num = letter.filter(project_id=project_id,status='True').count   #获取项目未读信封数量
        except:
            unread_num = 0
        try:
            letter_num = letter.filter(project_id=project_id).count                 #获取项目总信封数量
        except:
            letter_num = 0
        result[x].append(unread_num)
        result[x].append(letter_num)                                                #将获取结果添加入返回字典中
    return result

def show_table_letter_func(username,project_id):
    letter_list = Letter.objects.filter(owner=username,project_id=project_id).order_by('status')  #取项目信封情况并按照读取状态排序
    result = list(letter_list.values_list('time','ip','referer','method','ua','status','id'))     #取特定字段并转换成列表
    return result
