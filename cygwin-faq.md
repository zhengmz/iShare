Cygwin 使用大全
====

### 桌面快捷图标的命令是：

    C:\Cygwin\bin\mintty.exe -i /Cygwin-Terminal.ico -
    
### 如果是手工拷贝目录安装，则需要mount以下目录：

    C:/Cygwin/bin on /usr/bin type ntfs (binary,auto)
    C:/Cygwin/lib on /usr/lib type ntfs (binary,auto)
    C:/Cygwin on / type ntfs (binary,auto)
 
### 在cygwin中运行apache

  1. 首先得通过setup工具装好apache，并确保运行正确

     如要先安装libapr-develop

  2. 先运行cygserver，使用以下命令使其成为windows下的一个服务，然后确保其运行正常


     /usr/bin/cygserver-config

  3. 再运行Apache server

     有两种方式：
     - /usr/sbin/apachectl2 start
     - /usr/sbin/httpd2-config 将httpd变成windows下的一个服务，然后再运行
