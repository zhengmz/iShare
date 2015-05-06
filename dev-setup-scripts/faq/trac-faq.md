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

5. 常规配置

   a. 字符集, 修改trac.ini中

        default_charset = utf-8
        default_language = zh_CN

   b. 设置邮件通知, 注意smtp_port不能用465, 只能用25

        smtp_enabled = true
        smtp_from = trac@flowsea.com
        smtp_from_author = true
        smtp_from_name = Trac管理者
        smtp_password = password
        smtp_port = 25
        smtp_replyto = trac@flowsea.com
        smtp_server = smtp.exmail.qq.com
        smtp_user = trac@flowsea.com

   c. 解决搜索两个中文字出问题(提示少于3字符)

        [search]
        min_query_length = 0

6. 安装插件

   <更多插件请参考 trac-plugin.md>

   a. 用户管理插件AccountManagerPlugin

    - 安装: easy_install https://trac-hacks.org/svn/accountmanagerplugin/tags/acct_mgr-0.4.4
            安装之前要有svn

    - 配置注意：(大小写敏感)

      - 虽然只使用到HtPasswdStore, 但不仅要安装HtPasswdHashMethod, 而且也要安装HtDigestHashMethod.
      - 如果使用用户注册模块, 也需要把acct_mgr.register下的几个check都enabled才行
      - password_store需要人工配置, 根据用到的Store类型, 如account-manager.password_store = HtPasswdStore, 如果使用多个可直接在后面空格追加
      - 需要给管理员增加一个新的管理权限ACCTMGR_USER_ADMIN
      - 打开acct_mgr.notification.* = enabled, 支持通知

    - 安装完, 要把原有的登录模块取消, 如果是在网页admin上设置，先把本插件的登录模块打开，再取消：

          trac.web.auth.loginmodule = disabled

    - 相应的，也要把tracd和web server中的权限认证关掉

    - 参考网址: http://trac-hacks.org/wiki/CookBook/AccountManagerPluginConfiguration

   b. 汉化插件zoomquiettranslation

    - 下载源码: svn co http://trac-hacks.org/svn/zoomquiettranslation/trunk/0.11.x

    - 安装:

          trac-admin /path/to/your/env wiki load default-pages/

    - 配置trac.ini(可选)

          [mainnav]
          wiki.href = /wiki/ZhWikiStart

          [metanav]
          help.href = /wiki/ZhTracGuide

    - 复制ZhTracGuideToc.py到项目环境的plugins目录下
      暂时不知道为什么，删除了也能使用

    - 参考网址: 

          http://trac-hacks.org/wiki/ZoomQuiet
          http://trac-hacks.org/wiki/TracChineseTranslation

7. 其他

   a. wiki 转 html
      有时候需要把纯文本格式的 Wiki 转成 HTML 页面，比如发表到博客什么的。 这时候可以使用这个方案：
      http://trac.edgewall.org/wiki/CookBook/Scripts/StandaloneWiki2Html#no1

   b. 在wiki或ticket中增加附件后，如何删除
      只能在命令行执行：
      trac-admin /opt/trac/rcs attachment remove wiki:BizGlossary logo_old.png
      另外，删除保存在环境目录下的files

