<h1 align="center" style="margin-bottom: 20px;">Python网站开发源码实战篇</h1>
<p align="center"><code>版本号:1.1</code></p>
<p align="center">作者: [雷小天博客](https://www.100txy.com)</p>
<p align="center">项目: python3-website(基于廖雪峰的awesome)</p>  

# 项目预览  
部署在电信云上面，因为电信云主机80端口默认都是关闭的，需要申请备案才给开放，我也懒得备案，就用88端口。网址：http://113.108.94.191:88/ 欢迎交流学习  
[预览](http://113.108.94.191:88/)  


# 开发环境
Python版本是3.6.x  异步框架aiohttp  前端模板引擎jinja2  MySQL的Python异步驱动程序aiomysql  MySQL 5.x数据库、Python的第三方库watchdog可以利用操作系统的API来监控目录文件的变化

# 开发步骤  
## *一、Linux 安装python3.7.0*  
我这里使用的时centos7-mini，centos系统本身默认安装有python2.x，版本x根据不同版本系统有所不同，可通过 python --V 或 python --version 查看系统自带的python版本  有一些系统命令时需要用到python2，不能卸载  

**1、安装依赖包**                                                                       

1）首先安装gcc编译器，gcc有些系统版本已经默认安装，通过  gcc --version  查看，没安装的先安装gcc，yum -y install gcc  

2）安装其它依赖包，（注：不要缺少，否则有可能安装python出错，python3.7.0以下的版本可不装 libffi-devel ）

`yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel libffi-devel`  

**2、下载python3.7.0源码，根据需求下载**                                 

1）在https://www.python.org/ftp/python/中选择自己需要的python源码包，我下载的是python3.7.0

(大家也可以去https://www.python.org官网首页下载，找到downloads，就可以选择想要的版本下载了)  
![version](/www/static/images/py1.png)

2）下载

wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz  

3）、解压Python-3.7.0.tgz

`tar -zxvf Python-3.7.0.tgz`

**3、建立一个空文件夹，用于存放python3程序**　　　　　　　　

`mkdir /usr/local/python3`  

**4、执行配置文件，编译，编译安装**　　　　　　　　　　　　

`cd Python-3.7.0`  
`./configure --prefix=/usr/local/python3 `  
`make && make install`  

安装完成没有提示错误便安装成功了

**5、建立软连接**　　　　　　　　　　　　　　　　　　　　　

`ln -s /usr/local/python3/bin/python3.7 /usr/bin/python3`   
`ln -s /usr/local/python3/bin/pip3.7 /usr/bin/pip3`  

**6、测试一下python3是否可以用**　　　　　　　　　　　　　　

`[root@mini Python-3.7.0]# python3`    
`Python 3.7.0 (default, Jul 28 2018, 22:47:29)`    
`[GCC 4.8.5 20150623 (Red Hat 4.8.5-28)] on linux`     
`Type "help", "copyright", "credits" or "license" for more information. `  
```python
>>> print("hello world!")  
hello world!  
>>> exit()  
```
`[root@mini Python-3.7.0]# pip3 --version`  
`pip 10.0.1 from /usr/local/python3/lib/python3.7/site-packages/pip (python 3.7)`   

可以看到python3.7.0可以正常使用

## *二、Linux 安装pip*  
如果你重新安装了Python3.7.0，那么pip会自带安装的，如果你用的是系统Python2.X，那么你需要自己安装pip  
在linux中安装pip命令，如果直接用yum install 安装可能会遇到很多问题。官网的这个方法可以很快很安全的安装好pip  

官网地址：https://pypi.python.org/pypi/pip/
**1、打开pip官网后，点击“Installation”**

![pip1](/www/static/images/pip1.png)

**2、进入Installation页面后，右键点击“get-pip.py”,选择“复制链接地址”**

![pip2](/www/static/images/pip2.png)

**3、在Linux中输入 wget 粘帖复制的地址**

**4、下载完成后，执行命令python get-pip.py**
![pip3](/www/static/images/pip3.png)

# 部署方式  
利用Python自带的asyncio，我们已经编写了一个异步高性能服务器。但是，我们还需要一个高性能的Web服务器，这里选择Nginx，它可以处理静态资源，同时作为反向代理把动态请求交给Python代码处理。这个模型如下：
![nginx-awesome-mysql](/www/static/images/ps1.png)  
Nginx负责分发请求：  
![browser-nginx-awesome](/www/static/images/ps2.png)  
在服务器端，我们需要定义好部署的目录结构：  
`/`  
`+- srv/`  
   `+- awesome/       <-- Web App根目录`  
      `+- www/        <-- 存放Python源码`    
      `|  +- static/  <-- 存放静态资源文件`    
      `+- log/        <-- 存放log`    
在服务器上部署，要考虑到新版本如果运行不正常，需要回退到旧版本时怎么办。每次用新的代码覆盖掉旧的文件是不行的，需要一个类似版本控制的机制。由于Linux系统提供了软链接功能，所以，我们把www作为一个软链接，它指向哪个目录，哪个目录就是当前运行的版本：  
![browser-nginx-awesome](/www/static/images/ps3.png)  

而Nginx和python代码的配置文件只需要指向`www`目录即可。  

Nginx可以作为服务进程直接启动，但`app.py`还不行，所以，`Supervisor`登场！Supervisor是一个管理进程的工具，可以随系统启动而启动服务，它还时刻监控服务进程，如果服务进程意外退出，Supervisor可以自动重启服务。

总结一下我们需要用到的服务有：

* Nginx：高性能Web服务器+负责反向代理；

* Supervisor：监控服务进程的工具；

* MySQL：数据库服务。

在Linux服务器上用apt可以直接安装上述服务：  
`$ sudo apt-get install nginx supervisor python3 mysql-server`  
然后，再把我们自己的Web App用到的Python库安装了：  
`$ sudo pip3 install jinja2 aiomysql aiohttp`  
在服务器上创建目录/srv/awesome/以及相应的子目录。  

在服务器上初始化MySQL数据库，把数据库初始化脚本schema.sql复制到服务器上执行：  
`$ mysql -u root -p < schema.sql`  
服务器端准备就绪。

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
