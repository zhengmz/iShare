Cygwin 使用大全
====

一、使用与安装相关
----

### 1.1 桌面快捷图标的命令是：

    C:\Cygwin\bin\mintty.exe -i /Cygwin-Terminal.ico -
    
### 1.2 如果是手工拷贝目录安装，则需要mount以下目录：

    C:/Cygwin/bin on /usr/bin type ntfs (binary,auto)
    C:/Cygwin/lib on /usr/lib type ntfs (binary,auto)
    C:/Cygwin on / type ntfs (binary,auto)

二、Cygwin高级应用
----
 
### 2.1 在cygwin中运行apache

1. 首先得通过setup工具装好apache，并确保运行正确

2. 然后运行cygserver，使用以下命令使其成为windows下的一个服务，然后确保其运行正常

        /usr/bin/cygserver-config

3. 再运行Apache server

  有两种方式：

   - 方式一：直接在cygwin环境下运行

         /usr/sbin/apachectl2 start

   - 方式二：将httpd变成windows下的一个服务，然后再运行 (需要先安装libapr-develop)

         /usr/sbin/httpd2-config 

### 2.2 cygwin配置

请参阅文章：[《惊艳的cygwin——Windows下的Linux命令行环境的配置和使用》](http://oldratlee.com/post/2012-12-22/stunning-cygwin)

1. 文件权限问题： 显示文件权限为正常的-rw-r--r--
2. vi配置： 让vi能识别语法
3. 显示：ls、grep、dir输出彩色显示，文件大小以K、M、G显示

三、其他
----

1. 有时，安装完应用后，在运行时出错，可能需要rebase一下

  - 退出所有的终端
  - 在windows中的运行

     C:\Cygwin\bin\ash.exe

  - 然后运行

    rebaseall

  - 重新进行Cygwin就可以了

