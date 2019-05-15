from config import Keep_time,Keep_open
from .models import Letter
import requests,queue,time,threading

'''
使用独立于主线程的其他线程
来保持通用项目的cookie信息'活性'
适用于用户量不大的网站
'''

def hours_before():
    t = time.time() - Keep_time*60*60
    t = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(t))
    return t

def create_queue():                                                                    #从数据库查询需要操作的信封
    Letter_queue = queue.Queue()                                                       #并加入到任务队列中
    lowest_time = hours_before()
    try:
        keep_letter = Letter.objects.filter(status='True',time__gt=lowest_time,keep_alive='True').values_list('referer','ua','rev_value')
    except:
        return Letter_queue
    letter_list = list(keep_letter)
    for x in letter_list:
        Letter_queue.put(x)
    return Letter_queue

def keep_alive():
    while True:
        time.sleep(2)                                                                   #请求间隔
        task_queue = create_queue()
        while not task_queue.empty():
            task = task_queue.get()
            url = task[0]
            ua = task[1]
            cookie = task[2][7:]
            headers = {'User-Agent': ua, 'Cookie': cookie}
            try:
                requests.get(url, headers=headers,timeout=2)
            except:
                pass
        if task_queue.empty() == True:
            time.sleep(2)

if Keep_open:
    t1 = threading.Thread(target=keep_alive)
    t1.setDaemon(True)                                                                   #设置守护线程
    t1.start()