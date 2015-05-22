亚马逊主机搭建过程

创建instance, 实现远程密码登录

1. 先注册aws用户，并通过绑定银行卡来完成登记
2. 使用一个region来创建一个instance, 使用免费镜像，开通22和80端口
3. 创建实例时，也要创建一个新的登录加密钥，用puttygen把pem改成ppk
4. 使用登录加密钥登录到aws时, 修改ec2-user和root密码
5. 修改/etc/ssh/sshd_config，将PasswordAuthentication改为yes
6. 重启service sshd restart, 退出来即可登录

搭建nginx + php-fpm环境

1. 安装nginx
2. 安装php php-fpm php-mbstring php-gd php-mcrypt
3. 修改配置
4. 启动服务
5. 用dnspod修改域名绑定地址

