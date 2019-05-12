from django.db import models

class Payload(models.Model):                                #Payload表
    name = models.CharField(max_length=30)
    filename = models.CharField(max_length=100)
    explain = models.CharField(max_length=200)

class Project(models.Model):                                 #项目表
    project_id = models.CharField(max_length=10)
    name = models.CharField(max_length=30)
    owner = models.CharField(max_length=10)
    describe = models.CharField(max_length=500)
    create_time = models.CharField(max_length=50)
    payload = models.CharField(max_length=30)
    send_email = models.CharField(max_length=5)
    short_url = models.CharField(max_length=30)
    keep_alive = models.CharField(max_length=5)
    diy_payload = models.CharField(max_length=10000)

class Letter(models.Model):                                   #信封表
    time = models.CharField(max_length=50)
    owner = models.CharField(max_length=10)
    project_id = models.CharField(max_length=10)
    rev_value = models.CharField(max_length=10000)
    ip = models.CharField(max_length=15)
    method = models.CharField(max_length=6)
    referer = models.CharField(max_length=50)
    ua = models.CharField(max_length=200)
    status = models.CharField(max_length=5,default='True')
