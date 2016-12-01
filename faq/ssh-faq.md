SSH 使用笔记
====

一、信任登录
----

### 1.1 在本机执行命令：

    ssh-keygen

生成两个文件，如id_rsa和id_rsa.pub，其中, id_rsa是私钥，id_rsa.pub是公钥

### 1.2 拷贝公钥id_rsa.pub中的内容到远程机器

如远程机器为www.example.com，准备登录使用的用户是user1, 那么拷贝到/home/user1/.ssh/authorized_keys文件中.

### 1.3 完成信任连接

可以应用到以下场景：

1. 远程信任登录 如：

        ssh user1@www.example.com

2. 直接执行远程命令

        ssh user1@www.example.com "ls"

3. 还可以实现与ssh相关的其他场景如git

        git clone ssh://user1@www.example.com/opt/git/test.git

### 1.4 支持github.com

  在 https://github.com/settings/ssh 的配置中，新建一个ssh-key，把id_rsa.pub的内容拷贝进来即可

二、其他问题
----

### 2.1 目录文件权限问题

1. 从其他机器拷贝authorized_keys和id_rsa时，需要注意的权限，否则可能无法实现信任登录

    目录.ssh 700
    文件id_rsa 600
    文件authorized_keys 644

### 2.2 配置问题

sshd的配置文件在/etc/ssh/sshd_config

1. 限制root用户从远程ssh访问: PermitRootLogin=no

2. 解决自动断开的问题:

   1) 修改/etc/profile中的TMOUT: 设置为0, 或注释掉

   2) 修改配置ClientAliveInterval为60, ClientAliveCountMax为3
