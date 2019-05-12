# 使用Django打造属于自己的XSS平台
## 地址
https://github.com/HackerYunen/Django-XSS-Platform

## 环境
+ python3

## 库文件
+ requests
+ django2
+ pymysql

## 说明
前端采用开源Bootstarp模板，后端使用Django打造而成。

## 功能
+ 邮件提醒
+ Cookie活性保持
+ 多用户模式

## TODO
+ 添加多个Payload

## 配置
大部分配置参数均可在config.py文件中修改。

## 使用
+ 1.在数据库中建好库，修改config.py文件里的内容
+ 2.初始化数据库：
 ```
 python manage.py makemigrations
 python manage.py migrate
 python manage.py sqlgrate function 0001
 ```  
+ 3.运行：
 ```
 python manage.py runserver
 ```

**注意此处由于使用了pymysql做Mysql引擎，故会产生一些错误，需要修改某些自带py库文件，具体请按照错误百度查询即可。**

## 截图
**主界面**  
![](https://cy-pic.kuaizhan.com/g3/5c/9f/1c57-dd7f-4066-a896-5699803c958046)  
项目列表页：  
![](https://cy-pic.kuaizhan.com/g3/af/6f/6918-2798-4533-8393-9eb05af51cc835)  
项目详情页：  
![](https://cy-pic.kuaizhan.com/g3/93/a0/2283-38ff-4241-b1c0-f255028faae937)  
信封内容框：  
![](https://cy-pic.kuaizhan.com/g3/18/47/0601-97ca-4f18-9dbb-4e27a69dc84923)  
添加项目页：  
![](https://cy-pic.kuaizhan.com/g3/89/0f/4088-9a62-4660-bada-866b4d935d8a72)   
修改密码框：  
![](https://cy-pic.kuaizhan.com/g3/dc/1d/f293-41ce-4b4b-a695-d3fc52c7528975)