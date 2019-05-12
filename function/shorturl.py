from config import App_key
import requests

'''
短链接生成
接口c7.gg
'''

def url_to_short(url):
    r = requests.get("http://api.c7.gg/api.php?url={0}&apikey={1}".format(url,App_key))
    return r.text