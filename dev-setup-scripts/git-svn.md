记录git与svn相关的问题
=====

svn迁移到git乱码问题解决
-----
来源：http://guoyunsky.iteye.com/blog/1845303

  公司之前使用svn进行代码管理,现在需要迁移到git。迁移到git很顺利，只需要安装git-svn即可。但迁移之后发现运行git log命令后，之前的那些commit消息都是乱码,花了点时间搞定了.网上没有搜到类似的资料,这里记录下,希望可以帮到有需要的人。
 
  这里以svn工程地址为 svn://192.168.1.1/my-project为例
### 1.首先需要安装git-svn：
    Ubuntu下很简单，运行命令:sudo apt-get install git-svn

### 2.svn代码迁移到git(有乱码)：
  可以通过一句命令就搞定:
    
    git svn clone svn://192.168.1.1/my-project/
    
  因为就是这样一条命令,发现会有乱码。所以采用下面的方案
 
### 3.svn代码迁移到git(无乱码)：

    #创建工程目录  
    sudo mkdir /tmp/my-project.git  
    cd /tmp/my-project.git  
      
    #初始化git  
    git svn init svn://192.168.1.1/my-project/  
      
    #设置编码和文件名允许中文等字符  
    git config --global core.quotepath false         #设置文件名允许中文等字符  
    git config --global gui.encoding utf-8           #设置git界面编码  
    git config --global i18n.commitencoding utf-8    #设置git commit时的编码  
    git config --global i18n.logoutputencoding utf-8 #设置git log输出时编码  
    export LESSCHARSET=utf-8  
    
    #获取代码  
    git svn fetch  
