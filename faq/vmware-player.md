VMWare-player 使用问题集锦
====

一、安装相关
----

### 1.1 修改虚拟机网卡的网段

1. vmplayer网络配置命令
vnetlib -- stop nat
vnetlib -- stop dhcp
vnetlib -- set vnet vmnet8 mask 255.255.255.0
vnetlib -- set vnet vmnet8 addr 192.168.88.0
vnetlib -- update dhcp vmnet8
vnetlib -- update nat vmnet8
vnetlib -- update adapter vmnet8

vnetlib -- set vnet vmnet1 mask 255.255.255.0
vnetlib -- set vnet vmnet1 addr 192.168.81.0
vnetlib -- update dhcp vmnet1
vnetlib -- update nat vmnet1
vnetlib -- update adapter vmnet1
vnetlib -- start dhcp
vnetlib -- start nat

2. 恢复原来配置

vnetlib -- export backup-file-name
vnetlib -- import backup-file-name

3. 虚拟网卡管理操作

vnetlib -- remove adapter vmnet*
vnetlib -- add adapter vmnet1
vnetlib -- update all

### 1.2 修改虚拟机的固定IP

1. 找到虚拟机的网络MAC，在C:\ProgramData\VMware\vmnetdhcp.conf文件后面增加

	host centos7-rcs {
	    hardware ethernet 00:0C:29:C4:B8:27;
	    fixed-address 192.168.88.10;
	}

  host后面的主机名可以随意
  然后重启VMnetDHCP服务

  更新VMWare会覆盖，需要重新添加


二、GuestOS相关
----

### 2.1 无法实现文件共享

问题描述: 通过systemctl status vmware-tools时，出现“Guest filesystem driver:[FAILED]”问题
问题分析: 可能是kernel升级后，driver已失效，需要重新编译，或者vmware-tools需要升级
解决方案: 重装vmware-tools

### 2.2 使用vmware-config-tool.pl编译vmhgfs模块时出错

问题描述: 出现在文件page.c中函数HgfsWbRequestWait中的wait_on_bit
解决方案: 解开/usr/lib/vmware-tools/modules/source/vmhgfs.tar, 将page.c中的

    #if LINUX_VERSION_CODE < KERNEL_VERSION(3, 17, 0)

此段语句注释掉，重新打包tar文件即可



