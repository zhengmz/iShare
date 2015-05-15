插件介绍

0. tracwiki2html.py 将wiki转化成html
   网址：http://trac.edgewall.org/wiki/CookBook/Scripts/StandaloneWiki2Html#no1

0. AccountManagerPlugin 用户管理
   网址: https://trac-hacks.org/wiki/AccountManagerPlugin

1. TracChineseTranslation Wiki汉化
   网址: http://trac-hacks.org/wiki/ZoomQuiet
         http://trac-hacks.org/wiki/TracChineseTranslation

2. CcSelectorPlugin 在选择属主时，可以通过昵称来选择
   网址: http://trac-hacks.org/wiki/CcSelectorPlugin

3. RobotsTxtPlugin 可以生成robots.txt
   网址：http://trac-hacks.org/wiki/RobotsTxtPlugin

4. AutocompleteUsersPlugin 账号输入自动完成
   需要重新生成deploy
   网址: http://trac-hacks.org/wiki/AutocompleteUsersPlugin

5. TracWysiwygPlugin 给非技术人员使用，达到了部分的“所见即所得”效果
   需要重新生成deploy
   网址: http://trac-hacks.org/wiki/TracWysiwygPlugin

6. CustomFieldAdminPlugin 自定义字段
   将在trac 1.2 中增加
   需要重新生成deploy
   网址: http://trac-hacks.org/wiki/CustomFieldAdminPlugin

7. 动态生成图形
   网址：http://trac-hacks.org/wiki/GraphvizPlugin

8. TracSqlPlugin 实现SQL功能支持 SQLite、MySQL、 PostgreSQL 
   网址：http://trac-hacks.org/wiki/TracSqlPlugin
         https://github.com/mrjbq7/tracsql/
   问题：Query输出时另存为CSV时，出现“UnicodeEncodeError: 'ascii' codec can't encode characters in position 28-30: ordinal not in range(128)”
   原因: 生成的每一行都有一个"\n", 用str()出错
   解决: 在tracsql/web_ui.py中的前面增加:

         import sys
         reload(sys)
         sys.setdefaultencoding("utf-8")


9. XmlRpcPlugin 提供了 XML-RPC 机制，让Eclipse可以直接访问
   网址：http://trac-hacks.org/wiki/XmlRpcPlugin

10.TracTicketValidatorPlugin Ticket验证
   网址：http://trac-hacks.org/wiki/TracTicketValidatorPlugin

11.TracMetrixPlugin 可视化地显示项目的状态：通过统计生成一系列的表格和图片
   网址：http://trac-hacks.org/wiki/TracMetrixPlugin

12.TestManagerForTracPlugin 不仅可以创建测试用例，并通过 Catalogs 概念来管理用例
   网址：http://trac-hacks.org/wiki/TestManagerForTracPlugin

13.NoAnonymousPlugin 把所有人的默认页面都直接转到login
   需要使用AccountManagerPlugin.
   网址: http://trac-hacks.org/wiki/NoAnonymousPlugin

14.PermRedirectPlugin 有条件的用户重定向
   代替权限出错时，trac总报错"Permission Error:"，而是定向到login
   网址：http://trac-hacks.org/wiki/PermRedirectPlugin

15.ChangeLogMacro 定义ChangeLog的宏，显示代码变更情况
   网址：http://trac-hacks.org/wiki/ChangeLogMacro

16.FineGrainedPageAuthzEditorPlugin 细化权限控制的可视化编辑工具
   网址：http://trac-hacks.org/wiki/FineGrainedPageAuthzEditorPlugin

17.TracTicketTemplatePlugin Ticket模板定义
   网址：http://trac-hacks.org/wiki/TracTicketTemplatePlugin

18.SectionEditPlugin 编辑单个Section，比整个文件快
   网址：http://trac-hacks.org/wiki/SectionEditPlugin

19.FullBlogPlugin 支持Blog
   网址：http://trac-hacks.org/wiki/FullBlogPlugin

20.TracMigratePlugin 迁移工具，可以在不同数据库之间迁移
   网址：http://trac-hacks.org/wiki/TracMigratePlugin

21.MarkdownMacro 在wiki以代码内嵌方式支持Markdown格式
   依赖python markdown: easy_install markdown
   python markdown又依赖importlib: easy_install importlib
   重启tracd 服务
   装完以后，发现意义不大，可以使用工具将md转为trac的wiki，再导入
   网址：http://trac-hacks.org/wiki/MarkdownMacro

22.TracHtmlNotificationPlugin 以HTML格式进行邮件通知
   网址：http://trac-hacks.org/wiki/TracHtmlNotificationPlugin

插件安装的注意事项:

1. 使用easy_insall 对所有trac环境有效，如

   easy_install http://trac-hacks.org/svn/tracwysiwygplugin/0.12

2. 对单实例有效：编译egg文件，拷贝到具体实例的plugin目录下即可

   cd 源代码目录
   python setup.py bdist_egg
   cp ./dist/BreadCrumbsNav-<version> <path-to-trac-env>/plugins/

3. 设置trac.ini来enable, 如

	[components]
	tracwysiwyg.* = enabled

4. 有时还需要重新运行:
   trac-admin /opt/trac/rcs deploy /tmp/deploy
   如对tracwysiwyg插件等

5. 安装完模板插件, 还需要对环境进行upgrade

6. 安装完成后，重新启动tracd服务

参考网址：
   http://blog.csdn.net/gzlaiyonghao/article/details/6654027
   http://www.elias.cn/Develop/TracMini
   http://trac-hacks.org/wiki/KTRAC

