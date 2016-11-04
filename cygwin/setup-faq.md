Cygwin 安装说明
====

一、常规安装的功能列表
----

### 1.1 基本命令

    - bzip
    - vim
    - wget
    - rsync

### 1.2 开发相关

    - gcc
    - gdb
    - autoconf
    - automake
    - cmake
    - make

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

### 2.2 编译lua5.1.5
  - libncurses-devel

### 2.3 编译hiredis
  - 在64位下，需要将-std=c99去掉，要不然strdup有问题，出现coredump.
  - DYLIBSUFFIX从so改成dll
  - 在DYLIB_MAKE_CMD中去掉 -Wl,-soname,$(DYLIB_MINOR_NAME)
  - 如果要编译test.c, 将struct config中的子结构unix改成unix_s
