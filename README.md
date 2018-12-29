<h1 align="center" style="margin-bottom: 20px;">Python网站开发源码实战篇</h1>
<p align="center"><code>版本号:1.1</code></p>
<p align="center">作者: [雷小天博客](https://www.100txy.com)</p>
<p align="center">项目: python3-website</p>
# 项目预览
[预览](http://113.108.94.191:88/)

# 开发环境
Python版本是3.6.x  异步框架aiohttp  前端模板引擎jinja2  MySQL的Python异步驱动程序aiomysql  MySQL 5.x数据库、Python的第三方库watchdog可以利用操作系统的API来监控目录文件的变化

# 资源文件
jQuery压缩库  uikit这个强大的CSS框架

## 赞助
[小额赞助](https://www.100txy.com/Home/Index/alidonate.html)

## 项目开发记录

## 实现简单MVC

![实现简单MVC](/www/static/images/showmvc.jpg)

## 构建前端

![构建前端](/www/static/images/index.jpg)

## 实现web API

![实现web API](/www/static/images/jsonapi.jpg)

## 实现用户注册登录

![实现用户注册登录](/www/static/images/rigister.jpg)

## 完成

![完成](/www/static/images/allshow.jpg)

## 注意
初始化数据库，需要把schema.sql文件放到mysql.exe同级目录，然后输入命令：$ mysql -u root -p < schema.sql 进行初始化，文件放在conf目录下
初始化数据库之后，需要添加Users表数据，运行test.py文件即可添加一条数据。
