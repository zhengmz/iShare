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

   - 还有一种办法是修改/etc/systemd/system/redis.service.d/limit.conf

### 1.2 redis.log中出现overcommit_memory的告警

1. 即时生效:

    echo 1 > /proc/sys/vm/overcommit_memory

2. 永久生效:
   在/etc/sysctl.conf中增加:

    vm.overcommit_memory = 1

### 1.3 redis.log中出现somaxconn的告警

1. 即时生效:

    echo 1024 > /proc/sys/net/core/somaxconn

2. 永久生效:
   在/etc/sysctl.conf中增加:

    net.core.somaxconn = 1024

### 1.4 redis.log中出现THP的告警

1. 即时生效：

    echo never > /sys/kernel/mm/transparent_hugepage/enabled

2. 永久生效:
   在/etc/rc.local中增加:

    # For redis
    在/etc/rc.local增加
    if test -f /sys/kernel/mm/transparent_hugepage/enabled; then
        echo never > /sys/kernel/mm/transparent_hugepage/enabled
    fi

  并且要设置成chmod +x /etc/rc.local

二、其他说明
----

### 2.1 redis.conf中的daemonize

1. 只对命令行redis-server有效, 使用systemctl时无效
2. systemctl时，如果要加上--daemonize yes, 必须在service中指定PIDFile = /data/redis/redis.pid

