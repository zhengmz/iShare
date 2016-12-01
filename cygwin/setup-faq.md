Cygwin 安装说明
====

一、常规安装的功能列表
----

### 1.1 基本命令

    - bzip
    - vim
    - wget
    - rsync
    - unzip
    - curl

### 1.2 开发相关

    - gcc
    - g++
    - gdb
    - autoconf
    - automake
    - cmake
    - make
    - libtool

### 1.3 常用库

    - libcurse-devel
    - libopenssl-devel
    - libopenssh-devel
    - libreadline-devel

### 1.4 数据库

    - libmysqlclient-devel

### 1.5 序列化

    - libprotobuf-devel

二、rcs公共库所需
----

### 2.1 编译mysqlpp3.2.2:
  - libmysqlclient-devel
  - libintl-devel

  - 修改configure中判断libmysqlclient，增加.dll
  - 修改ltmain.sh的链接为/usr/share/libtool/build-aux/ltmain.sh

### 2.2 编译lua5.1.5
  - libncurses-devel

### 2.3 编译hiredis
  - 在64位下，需要将-std=c99去掉，要不然strdup有问题，出现coredump; 32位无问题
  - 在setTimeout中: setsockopt函数无效, 64位和32位都有问题
  - DYLIBSUFFIX从so改成dll
  - 在DYLIB_MAKE_CMD中去掉 -Wl,-soname,$(DYLIB_MINOR_NAME)
  - 如果要编译test.c, 将struct config中的子结构unix改成unix_s

### 2.4 编译ftplib4.0-1
  - 在Cygwin编译的注意事项

	创建两个定义:
	lib: libftp.a
	slib: libftp.dll

	增加一个规则:
	libftp.dll: ftplib.o
		$(CC) -shared -o $@ $< -lc

	修改一个规则(在cygwin下去掉了线程的重入，所以将_REENTRANT去掉):
	ftplib.o: ftplib.c ftplib.h
		#$(CC) -c $(CFLAGS) -fPIC -D_REENTRANT $< -o $@
		$(CC) -c $(CFLAGS) -fPIC $< -o $@
  - 在Linux下正常
