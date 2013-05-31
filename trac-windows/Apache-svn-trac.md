Apache + svn + trac 安装与配置
====

一、安装顺序与配置
-----
1.  安装apache_2.2.11-win32-x86-openssl-0.9.8i.msi
2.  安装python-2.5.4.msi，建议默认路径设置
3.  安装Setup-Subversion-1.6.1.msi
4.  安装svn-python-1.6.1.win32-py2.5.exe
5.  安装pysqlite-2.5.5.win32-py2.5.exe
6.  安装mod_python-3.3.1.win32-py2.5-Apache2.2.exe
7.  安装setuptools-0.6c9.win32-py2.5.exe
8.  安装Genshi-0.5.1.win32-py2.5.exe
9.  安装Trac-0.11.4.win32.exe
10. 下载sqlite-3_6_14_2.zip，用于管理sqliteDB

二、subversion与Apache的集成
-----
1. 拷贝bin目录下的mod_dav_svn.so和mod_authz_svn.so到apache安装目录下的modules目录
2. 增加Subversion/bin路径到系统SYSTEM环境变量PATH, 然后重启机器，以便Apache能识别subversion的Dll文件
3. 修改Apache的配置文件httpd.conf:

  3a. 去掉以下两行的注释:

    #LoadModule dav_fs_module modules/mod_dav_fs.so
    #LoadModule dav_module modules/mod_dav.so

  3b. 增加以下两行:

      LoadModule dav_svn_module modules/mod_dav_svn.so
      LoadModule authz_svn_module modules/mod_authz_svn.so

  3c. 在文件结尾增加以下内容:

      # Support Subversion config
      Include conf/extra/mod_svn.conf

  3d. 将mod_svn.conf拷贝到Apache安装目录下的conf/extra

4. 创建subversion的库

     svnadmin create e:\svn\svntest

5. 利用htpasswd命令创建密码文件

    htpasswd -cm e:\svn\svn_auth_file harry
    htpasswd -m e:\svn\svn_auth_file sally

6. 重启Apache

三、trac与Apache的集成
-----
使用mod_python替代CGI与Apache集成，以提高性能

1. 确认mod_python是否安装并配置成功

   1a. 确认mod_python.so拷贝到apache安装目录下的modules目录

   1b. 在httpd.conf增加LoadModule python_module modules/mod_python.so

2. 在Apache配置文件中增加以下内容:

      # Support trac config
      Include conf/extra/mod_trac.conf

3. 将mod_trac.conf拷贝到Apache安装目录下的conf/extra

   3a. 密码与subversion的共用即可

4. 创建trac项目

   4a. 在创建项目时，连接到subversion的一个repository就可以实现与subversion的集成

5. 重启Apache


四、trac与Eclipse3.4 的集成
-----
参见: http://trac-hacks.org/wiki/EclipseTracPlugin

1.  安装XmlRpcPlugin

    主页: http://trac-hacks.org/wiki/XmlRpcPlugin

    1a. 解压xmlrpcplugin-r5917.zip

    1b. cd xmlrpcplugin

    1c. 运行命令"C:\Python25\Scripts\easy_install.exe 0.10"

    1d. 为支持trac 0.11，还需安装C:\Python25\Scripts\easy_install.exe trunk

2.  同样的方法安装eclipsetracplugin_tracrpcext_0.10-r5917.zip

3.  配置trac.ini, 增加以下内容:

    [components]
    tracrpc.* = enabled
    tracrpcext.* = enabled

4.  在Eclipse3.4安装plugin:  EclipseTrac
    两种方法，一种通过update，一种直接安装

    4a. 通过update的site: http://trac-hacks.org/svn/eclipsetracplugin/eclipse/update/

    4b. 直接安装的文件为EclipseTrac.zip

5. 重启Trac Server和Eclipse

6. 增加一个视图trac, 可以编辑和预览wiki

五、trac与Eclipse3.4 和 MyIyn的集成
-----
1. 先实现trac 与 Eclipse的集成，请参见《四》

2. 从Eclipse的Mylyn Extras update 中选择trac

3. 重启Eclipse, 即可

六、subversion与Eclipse的集成
-----
1. 在Eclipse增加update site: http://subclipse.tigris.org/update_1.6.x

2. 选择subclipse安装

3. 重启Eclipse, 即可
