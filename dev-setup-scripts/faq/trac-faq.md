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

5. 配置

   5a. 设置权限

        chown -R apache.apache /opt/trac/rcs

   如果使用selinux，还需要设置
   Step1: chcon -R -t httpd_sys_rw_content_t /opt/trac
   Step2: semanage fcontext -a -t httpd_sys_rw_content_t "/opt/trac(/.*)?"
   
   5b. 字符集, 修改trac.ini中

        default_charset = utf-8
        default_language = zh_CN

   5c. 设置邮件通知, 注意smtp_port不能用465, 只能用25

        smtp_enabled = true
        smtp_from = trac@flowsea.com
        smtp_from_author = true
        smtp_from_name = Trac管理者
        smtp_password = password
        smtp_port = 25
        smtp_replyto = trac@flowsea.com
        smtp_server = smtp.exmail.qq.com
        smtp_user = trac@flowsea.com

6. 安装插件

   6a. 用户管理插件AccountManagerPlugin

    - 安装: easy_install https://trac-hacks.org/svn/accountmanagerplugin/tags/acct_mgr-0.4.4
            安装之前要有svn

    - 配置注意：(大小写敏感)

      - 虽然只使用到HtPasswdStore, 但不仅要安装HtPasswdHashMethod, 而且也要安装HtDigestHashMethod. 配置account-manager.bash_method = HtPasswdHashMethod
      - 如果使用用户注册模块, 也需要把acct_mgr.register下的几个check都enabled才行
      - password_store需要人工配置, 根据用到的Store类型, 如account-manager.password_store = HtPasswdStore, 如果使用多个可直接在后面空格追加
      - 需要给管理员增加一个新的管理权限ACCTMGR_USER_ADMIN
      - 打开acct_mgr.notification.* = enabled, 支持通知

    - 安装完, 要把原有的登录模块取消, 如果是在网页admin上设置，先把本插件的登录模块打开，再取消：

        trac.web.auth.loginmodule = disabled

    - 相应的，也要把tracd和web server中的权限认证关掉

    - 参考网址: http://trac-hacks.org/wiki/CookBook/AccountManagerPluginConfiguration

