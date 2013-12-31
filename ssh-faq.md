SSH 使用笔记
====

一、信任登录
----

### 1.1 在本机执行命令：

    ssh-keygen

生成两个文件，如id_rsa和id_rsa.pub，其中, id_rsa是私钥，id_rsa.pub是公钥

### 1.2 拷贝上次生成的公钥id_rsa.pub中的内容到远程机器.ssh/authorized_keys文件

如远程机器为www.example.com，准备登录使用的用户是user1, 那么拷贝到/home/user1/.ssh/authorized_keys文件中.

### 1.3 在本地使用ssh user1@www.example.com登录即可

不仅实现远程ssh的信任登录，而且也实现对git的支持，当然git协议要使用ssh.
