Trac Plugin的安装方法：
=====

1.  安装Plugin

    1a. 解压下载的plugin
    
    1b. 进入解压后目录
    
    1c. 运行命令"C:\Python25\Scripts\easy_install.exe 目录名"

2.  配置trac.ini, 增加以下内容:

        [components]
        具体plugin.* = enabled

3. 重启Trac Server和Eclipse

Plugin的作用
=====
1. WikiIncludePlugin

   用于在Wiki中引用另一Wiki内容
