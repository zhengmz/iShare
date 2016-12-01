redis使用问题集锦
====

一、问题列表
----

### 1.1 redis.log中出现"Redis can't set maximum open files to 10032 because of OS error: Operation not permitted"

1. 问题描述:

   在一台机器上启动多个redis实例时，会出现这个问题

2. 解决:

   - centos7之后 NOFILE 限制不在/etc/security/limits.conf中配置,
     而是在/usr/lib/systemd/system/redis.service中修改, 在service段中增加

       LimitNOFILE=10032

   - 如有多个实例, 则在每个实例中增加

二、其他说明
----

### 2.1 redis.conf中的daemonize

1. 只对命令行redis-server有效, 使用systemctl时无效
2. systemctl时，要加上--daemonize no

