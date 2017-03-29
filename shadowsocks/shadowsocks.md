1. 安装
===

    yum install -y python-setuptools
    easy_install pip
    pip install shadowsocks

  安装后, 可执行程序ssserver一般放在/usr/local/bin

2. 配置说明
===

  配置文件可以放在/usr/local/etc/shadowsocks.json
  单用户配置请参见shadowsocks-single.json
  多用户配置请参见shadowsocks-multi.json

3. 启停命令
===

   启动命令:

     ssserver -c /usr/local/etc/shadowsocks.json -d start

   停止命令:

     ssserver -c /usr/local/etc/shadowsocks.json -d stop

4. 配置service启动脚本
===

   拷贝shadowsocks-init到/etc/init.d/shadowsocks
   chkconfig shadowsocks on
