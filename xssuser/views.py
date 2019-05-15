from django.http import HttpResponse
from django.shortcuts import render,redirect
from config import Safe_code
from function.account import *
from function.ajax import *
from function.show import *
from function.filter import Method_check,Value_check,None_to_Blank
from function.keep import keep_alive
from django.contrib.auth.decorators import login_required


def user_login(request):
    if request.user.is_authenticated:                                               #检测是否登录，如登录则跳转
        return redirect('/user/')
    if request.method == 'GET':                                                     #按照请求方式返回内容
        return render(request,'user/login.html',{'Safe_code':Safe_code})
    elif request.method == 'POST':
        result = login(request)
        return HttpResponse(result)
    else:
        return HttpResponse('请求方式错误')

def user_register(request):
    if request.user.is_authenticated:
        return redirect('/user/')
    if request.method == 'GET':
        return render(request, 'user/register.html',{'Safe_code':Safe_code})
    elif request.method == 'POST':
        result = register(request)
        return HttpResponse(result)
    else:
        return HttpResponse('请求方式错误')

@login_required
def user_logout(request):                                                            #用户登出
    logout(request)
    return redirect('/user/login')

@login_required
def user_changepass(request):                                                        #修改密码
    if not Method_check(request,'POST'):
        return HttpResponse('请求方式错误')
    result = change_pass(request)
    return HttpResponse(result)

@login_required                                                                      #以下函数均要求登录权限
def show_index(request):                                                             #首页
    username = request.user.username
    render_dic = show_index_number_func(username)
    render_dic['payload_list'] = show_index_payload_func()
    return render(request,'user/index.html',render_dic)

@login_required
def show_project(request):                                                           #项目列表页
    username = request.user.username
    render_dic = {'project_list':show_table_project_func(username)}
    return render(request,'user/project.html',render_dic)

def show_addproject(request):
    render_dic = {'payload_name_list':show_payload_name_func()}
    return render(request,'user/addproject.html',render_dic)


@login_required
def show_letter(request):                                                            #项目详情页
    if not Method_check(request,'GET'):                                              #限制请求方式
        return HttpResponse('请求方式错误')

    username = request.user.username
    project_id = request.GET.get('id')

    if not Value_check(project_id):                                                  #检查字段完整
        return HttpResponse('请检查字段是否填写完整')

    render_dic = {'letter_list':show_table_letter_func(username,project_id)}
    return render(request,'user/projectinfo.html',render_dic)

@login_required
def ajax_letter_value(request):                                                      #Ajax获取信封内容
    username = request.user.username
    if not Method_check(request,'POST'):                                             #限制请求方式
        return HttpResponse('{"status":500,"value":"请求方式错误"}')

    letter_id = request.POST.get('letterid')

    if not Value_check(letter_id):                                                   #检查字段完整
        return HttpResponse('{"status":500,"value":"请检查字段是否填写完整"}')

    result = ajax_letter_value_func(username,letter_id)
    return HttpResponse('{' + '"status":{0},"value":"{1}"'.format(
                                        result[0], result[1]) + '}')

@login_required
def ajax_payload_explain(request):                                                   #Ajax获取explain
    if not Method_check(request,'POST'):                                             #限制请求方式
        return HttpResponse('{"status":500,"value":"请求方式错误"}')

    payload_name = request.POST.get('payload_name')

    if not Value_check(payload_name):                                                #检查字段完整
        return HttpResponse('{"status":500,"value":"请检查字段是否填写完整"}')

    result = ajax_payload_explain_func(payload_name)
    return HttpResponse('{'+'"status":{0},"value":"{1}","parameter":"{2}"'.format(
                        result[0],result[1],result[2])+'}')

@login_required
def ajax_delete_letter(request):                                                     #删除信封
    if not Method_check(request,'POST'):                                             #限制请求方式
        return HttpResponse('{"status":500,"value":"请求方式错误"}')

    username = request.user.username
    letter_id = request.POST.get('letterid')

    if not Value_check(letter_id):                                                   #检查字段完整
        return HttpResponse('{"status":500,"value":"请检查字段是否填写完整"}')

    result = ajax_delete_letter_func(username,letter_id)
    return HttpResponse('{' + '"status":{0},"value":"{1}"'.format(result[0], result[1]) + '}')

@login_required
def ajax_delete_project(request):                                                     #删除项目
    if not Method_check(request,'POST'):                                              #限制请求方式
        return HttpResponse('请求方式错误')

    username = request.user.username
    project_id = request.POST.get('projectid')

    if not Value_check(project_id):                                                   #检查字段完整
        return HttpResponse('{"status":500,"value":"请检查字段是否填写完整"}')

    result = ajax_delete_project_func(username,project_id)
    return HttpResponse('{' + '"status":{0},"value":"{1}"'.format(result[0], result[1]) + '}')

@login_required
def ajax_add_project(request):
    if not Method_check(request,'POST'):                                              #限制请求方式
        return HttpResponse('请求方式错误')

    username = request.user.username
    name = request.POST.get('name')
    describe = request.POST.get('describe')
    payload = request.POST.get('payload')
    send_email = request.POST.get('send_email').title()
    diy_payload = request.POST.get('diy_payload') if request.POST.get('diy_payload') != None else ''
    keep_alive = request.POST.get('keep_alive') if request.POST.get('keep_alive') != None else 'False'
    keep_alive = keep_alive.title()
    parameter = request.POST.get('parameter') if request.POST.get('parameter') != None else ''

    if not Value_check(name,describe,payload,send_email):                             #检查字段完整
        return HttpResponse('{"status":500,"value":"请检查字段是否填写完整"}')
    result = ajax_add_project_func(username, name, describe, payload,
                                   send_email, diy_payload=diy_payload,
                                   parameter=parameter,keep_alive=keep_alive)
    return HttpResponse('{'+'"status":{0},"value":"{1}"'.format(result[0],result[1])+'}')
