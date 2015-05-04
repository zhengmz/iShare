插件介绍

0. tracwiki2html.py 将wiki转化成html
   网址：http://trac.edgewall.org/wiki/CookBook/Scripts/StandaloneWiki2Html#no1

1. trac_zh.zip  Wiki汉化
   网址: http://trac-hacks.org/wiki/ZoomQuiet
         http://trac-hacks.org/wiki/TracChineseTranslation

2. trac_ccselectorplugin.zip 在选择属主时，可以通过昵称来选择
   网址: http://trac-hacks.org/wiki/CcSelectorPlugin

3. trac_robotstxt.zip 可以生成robots.txt

4. tracautocompleteplugin.zip 账号输入自动完成
   网址: http://trac-hacks.org/wiki/AutocompleteUsersPlugin

5. tracwysiwygplugin.zip 给非技术人员使用，达到了部分的“所见即所得”效果
   网址: http://trac-hacks.org/wiki/TracWysiwygPlugin

6. trac_customfieldadminplugin.zip 自定义字段
   将在trac 1.2 中增加
   网址: http://trac-hacks.org/wiki/CustomFieldAdminPlugin

7. 动态生成图形
   网址：http://trac-hacks.org/wiki/GraphvizPlugin

8. TracSqlPlugin 实现SQL功能支持 SQLite、MySQL、 PostgreSQL 
   网址：http://trac-hacks.org/wiki/TracSqlPlugin
         https://github.com/mrjbq7/tracsql/

9. XmlRpcPlugin 提供了 XML-RPC 机制，让Eclipse可以直接访问
   网址：http://trac-hacks.org/wiki/XmlRpcPlugin

10.TracTicketValidatorPlugin Ticket验证
   网址：http://trac-hacks.org/wiki/TracTicketValidatorPlugin

11.TracMetrixPlugin 可视化地显示项目的状态：通过统计生成一系列的表格和图片
   网址：http://trac-hacks.org/wiki/TracMetrixPlugin

12.TestManagerForTracPlugin 不仅可以创建测试用例，并通过 Catalogs 概念来管理用例
   网址：http://trac-hacks.org/wiki/TestManagerForTracPlugin


插件安装的两种方法:

1. 使用easy_insall 对所有trac环境有效，如

   easy_install http://trac-hacks.org/svn/tracwysiwygplugin/0.12

2. 进入源代码目录，编译一个egg文件，拷贝到一个具体实例的plugin目录下即可

   python setup.py bdist_egg
   cp ./dist/BreadCrumbsNav-<version> <path-to-trac-env>/plugins/

3. 设置trac.ini来enable, 如

	[components]
	tracwysiwyg.* = enabled

参考网址：http://blog.csdn.net/gzlaiyonghao/article/details/6654027

