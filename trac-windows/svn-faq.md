1. 如何设置svn自动属性 
=====
   修改 %APPPATH%/Subversion/config 文件 

   1a. 将 enable-auto-props = yes
   
   1b. 在[auto-props]后面增加以下内容:

            ##################################################
            ### Binary files
            ##################################################
            *.bmp   = svn:mime-type=image/bmp
            *.gif	= svn:mime-type=image/gif
            *.gz	= svn:mime-type=application/x-gzip
            *.ico	= svn:mime-type=image/x-icon
            *.jar	= svn:mime-type=application/zip
            *.jpg	= svn:mime-type=image/jpeg
            *.pdf	= svn:mime-type=application/pdf
            *.png	= svn:mime-type=image/png
            *.ps	= svn:mime-type=application/postscript
            *.tif	= svn:mime-type=image/tiff
            *.vsd	= svn:mime-type=application/octet-stream
            *.zip	= svn:mime-type=application/zip
            
            ##################################################
            ### Text files, OS dependent eol-style
            ##################################################
            *.dsp	= svn:eol-style=CRLF
            *.dsw	= svn:eol-style=CRLF
            *.mm	= svn:eol-style=LF;svn:mime-type=text/xml
            *.sh	= svn:eol-style=LF;svn:executable
            
            ##################################################
            ### Text files, eol-style is native
            ### Don't apply svn:keywords to program text 
            ###    such as .c .cpp .h .hh .js .java
            ### Because svn will convert it to UTF-8,
            ###    and 'gcc' can not work normally.
            ##################################################
            *.c	= svn:eol-style=native;svn:mime-type=text/plain
            *.cpp	= svn:eol-style=native;svn:mime-type=text/plain
            *.css	= svn:eol-style=native;svn:mime-type=text/css
            *.jsx = svn:eol-style=native
            *.cxf = svn:mime-type=text/xml;svn:eol-style=native;svn:keywords=Rev Date Author
            *.diff	= svn:eol-style=native;svn:mime-type=text/plain
            *.dsl	= svn:eol-style=native;svn:mime-type=text/sgml
            *.dtd	= svn:eol-style=native;svn:mime-type=text/plain
            *.ent	= svn:eol-style=native;svn:mime-type=text/plain
            *.gml	= svn:eol-style=native;svn:mime-type=text/sgml
            *.h	= svn:eol-style=native;svn:mime-type=text/plain;svn:keywords=Rev Date Author
            *.hh	= svn:eol-style=native;svn:mime-type=text/plain;svn:keywords=Rev Date Author
            *.htm	= svn:eol-style=native;svn:mime-type=text/html;svn:keywords=Rev Date Author
            *.html	= svn:eol-style=native;svn:mime-type=text/html;svn:keywords=Rev Date Author
            *.java	= svn:eol-style=native;svn:mime-type=text/plain
            *.js	= svn:eol-style=native;svn:mime-type=text/plain
            *.mod	= svn:eol-style=native;svn:mime-type=text/plain
            *.patch	= svn:eol-style=native;svn:mime-type=text/plain
            *.php	= svn:eol-style=native
            *.pl	= svn:eol-style=native
            *.py	= svn:eol-style=native
            *.bat = svn:eol-style=native
            *.pl  = svn:eol-style=native
            *.py  = svn:eol-style=native
            *.cmd = svn:eol-style=native
            *.sgm	= svn:eol-style=native;svn:mime-type=text/sgml
            *.sgml	= svn:eol-style=native;svn:mime-type=text/sgml
            *.svg	= svn:eol-style=native;svn:mime-type=text/xml
            *.txt	= svn:mime-type=text/plain
            *.xml	= svn:eol-style=native;svn:mime-type=text/xml;svn:keywords=Rev Date Author
            *.xsl	= svn:eol-style=native;svn:mime-type=text/xml;svn:keywords=Rev Date Author
            *.xslt	= svn:eol-style=native;svn:mime-type=text/xml
            *.xsd = svn:mime-type=text/xml;svn:eol-style=native;svn:keywords=Rev Date Author
            *.xjb = svn:mime-type=text/xml;svn:eol-style=native;svn:keywords=Rev Date Author
            *.wsdl = svn:mime-type=text/xml;svn:eol-style=native;svn:keywords=Rev Date Author
            *.properties = svn:mime-type=text/plain;svn:eol-style=native;svn:keywords=Rev Date Author
            .checkstyle = svn:mime-type=text/xml;svn:eol-style=native;svn:keywords=Rev Date Author
            .pmd = svn:mime-type=text/xml;svn:eol-style=native;svn:keywords=Rev Date Author
            .ruleset = svn:mime-type=text/xml;svn:eol-style=native;svn:keywords=Rev Date Author
            *.cat = svn:eol-style=native;svn:mime-type=text/plain
            Makefile* = svn:eol-style=native
            README*	= svn:eol-style=native;svn:mime-type=text/plain
            ChangeLog = svn:eol-style=native;svn:mime-type=text/plain
            LICENSE* = svn:eol-style=native;svn:mime-type=text/plain
            NOTICE* = svn:eol-style=native;svn:mime-type=text/plain
            TODO* = svn:eol-style=native;svn:mime-type=text/plain
            KEYS* = svn:eol-style=native;svn:mime-type=text/plain
            INSTALL* = svn:eol-style=native;svn:mime-type=text/plain
            WHATSNEW* = svn:eol-style=native;svn:mime-type=text/plain
            NEWS* = svn:eol-style=native;svn:mime-type=text/plain
            COPYING* = svn:eol-style=native;svn:mime-type=text/plain

   1c. 可能的问题是，在Linux/Unix下，自动用设置的字符集更新c/cpp文件时，会出现编译不识别更新后的源文件。
       所以建议不对源文件进行更新。

2. 在windows平台下，直接通过资源管理器修改文件或目录的名字会造成问题
=====
解决方法如下: 

   2a. 用TortoiseSVN的"relocate"命令找回目录
   
   2b. 修改文件或目录的名字
   
   2c. 删除不需要的，即可

3. 如何移动一个文件或目录到另一目录
=====
在安装TortoiseSVN的情况下:

   3a. 使用右键把要移动的文件或目录拖到目标目录上
   
   3b. 在弹出的菜单中，选择移动或移动重命名
   
     3b1. 对目录来说，原目录图标会出现打X的符号，按右键选择"clean up"
     
   3c. 提交即可
