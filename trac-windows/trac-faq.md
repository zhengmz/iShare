Trac的使用说明
=====

1. 创建管理员用户:

   1a. 进入trac项目的命令行管理

        trac-admin e:\trac\prjtest

   1b. permission add harry TRAC_ADMIN
   
   1c. 重新通过web进入trac项目，就可以使用webadmin来管理

2. Windows平台下的特殊处理

   2a. trac-admin所在路径是C:\Python25\Scripts\
   
   2b. 不能直接用notepad修改trac.ini，最好用cygwin的编辑器vi来修改

3. 在ticket中，需要通过下列菜单来选择用户

   3a. 修改trac.ini中的ticket块中的选项"restrict_owner"，改为true即可

4. 在安装WikiInclude Plugins时，出现无法与trac联动

   发现在setup.py中没有"entry_points={'trac.plugins': ...}"的内容，修改后可用
