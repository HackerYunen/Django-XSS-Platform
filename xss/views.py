from function.show import show_payload_func
from function.receive import rev_letter_func
from django.shortcuts import render
from django.http import HttpResponse

# 首页
def show_index(request):
    return render(request,'index/index.html')

def show_pyload(request):
    if request.method == 'GET':
        project_id = request.GET.get('id')
    elif request.method == 'POST':
        project_id = request.POST.get('id')
    else:
        project_id = 1
    payload = show_payload_func(project_id)
    return HttpResponse(payload)

def rev_value(request):
    status = rev_letter_func(request)
    if status == 'True':
        return HttpResponse('200 OK')
    else:
        return HttpResponse('404 Fail')