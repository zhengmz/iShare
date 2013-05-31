ETCDIR=/etc
EXTDIR=${DESTDIR}${ETCDIR}
MODE=754
DIRMODE=755
CONFMODE=644

# The grep can probably be improved upon.
all:
	@grep "^install" Makefile | cut -d ":" -f 1
	@echo "Select an appropriate install target from the above list" ; exit 1

create-dirs:
	install -d -m ${DIRMODE} ${EXTDIR}/rc.d/rc{0,1,2,3,4,5,6,sysinit}.d
	install -d -m ${DIRMODE} ${EXTDIR}/rc.d/init.d
	install -d -m ${DIRMODE} ${EXTDIR}/sysconfig

install-env:
	install -v -d -m ${DIRMODE} -o root -g root /etc/skel
	install -v -d -m ${DIRMODE} -o root -g root /etc/profile.d
	install -m ${CONFMODE} env/profile /etc
	install -m ${CONFMODE} env/bashrc /etc
	install -m ${CONFMODE} env/issue /etc
	install -m ${CONFMODE} env/shells /etc
	install -m ${CONFMODE} env/profile.d/* /etc/profile.d
	install -m ${CONFMODE} env/skel/.??* /etc/skel
	install -m ${CONFMODE} env/sysconfig/* /etc/sysconfig
	dircolors -p > /etc/dircolors

install-gpm:
	install -m ${CONFMODE} gpm/mouse /etc/sysconfig

install-autofs:
	install -m ${CONFMODE} autofs/auto.master /etc

install-dhcpcd:
	install -v -d /etc/sysconfig/network-devices/ifconfig.eth0
	install -m ${CONFMODE} dhcpcd/dhcpcd /etc/sysconfig/network-devices/ifconfig.eth0

install-xinetd: create-dirs
	install -m ${CONFMODE} xinetd/xinetd.conf /etc
	install -v -d -m ${DIRMODE} /etc/xinetd.d
	install -m ${CONFMODE} xinetd/xinetd.d/* /etc/xinetd.d
	install -m ${MODE} xinetd/xinetd     ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/xinetd ${EXTDIR}/rc.d/rc0.d/K49xinetd
	ln -sf  ../init.d/xinetd ${EXTDIR}/rc.d/rc1.d/K49xinetd
	ln -sf  ../init.d/xinetd ${EXTDIR}/rc.d/rc2.d/K49xinetd
	ln -sf  ../init.d/xinetd ${EXTDIR}/rc.d/rc3.d/S23xinetd
	ln -sf  ../init.d/xinetd ${EXTDIR}/rc.d/rc4.d/S23xinetd
	ln -sf  ../init.d/xinetd ${EXTDIR}/rc.d/rc5.d/S23xinetd
	ln -sf  ../init.d/xinetd ${EXTDIR}/rc.d/rc6.d/K49xinetd

install-pam:
	install -v -d -m ${DIRMODE} /etc/pam.d
	install -m ${CONFMODE} pam/* /etc/pam.d

install-vsftp:
	install -m ${CONFMODE} vsftp/vsftpd.conf /etc
	install -v -d -m ${DIRMODE} /etc/xinetd.d
	install -m ${CONFMODE} vsftp/vsftpd /etc/xinetd.d

install-apache: create-dirs
	install -m ${MODE} apache/apache     ${EXTDIR}/rc.d/init.d/
	ln -sf  ../init.d/apache ${EXTDIR}/rc.d/rc0.d/K28apache
	ln -sf  ../init.d/apache ${EXTDIR}/rc.d/rc1.d/K28apache
	ln -sf  ../init.d/apache ${EXTDIR}/rc.d/rc2.d/K28apache
	ln -sf  ../init.d/apache ${EXTDIR}/rc.d/rc3.d/S32apache
	ln -sf  ../init.d/apache ${EXTDIR}/rc.d/rc4.d/S32apache
	ln -sf  ../init.d/apache ${EXTDIR}/rc.d/rc5.d/S32apache
	ln -sf  ../init.d/apache ${EXTDIR}/rc.d/rc6.d/K28apache

install-svn: create-dirs
	install -m ${CONFMODE} svn/svn.xinetd ${EXTDIR}/xinetd.d/svn
	install -v -d -m ${DIRMODE} ${EXTDIR}/subversion
	install -m ${CONFMODE} svn/etc/* ${EXTDIR}/subversion
#	install -m ${MODE} svn/svn.initd        ${EXTDIR}/rc.d/init.d/svn
#	ln -sf ../init.d/svn ${EXTDIR}/rc.d/rc0.d/K27svn
#	ln -sf ../init.d/svn ${EXTDIR}/rc.d/rc1.d/K27svn
#	ln -sf ../init.d/svn ${EXTDIR}/rc.d/rc2.d/K27svn
#	ln -sf ../init.d/svn ${EXTDIR}/rc.d/rc3.d/S33svn
#	ln -sf ../init.d/svn ${EXTDIR}/rc.d/rc4.d/S33svn
#	ln -sf ../init.d/svn ${EXTDIR}/rc.d/rc5.d/S33svn
#	ln -sf ../init.d/svn ${EXTDIR}/rc.d/rc6.d/K27svn

install-mod_svn:
	install -m ${CONFMODE} svn/mod_svn.conf /opt/apache/conf/extra

install-mod_python:
	install -m ${CONFMODE} mod_python/mod_python.conf /opt/apache/conf/extra

install-xorg:
	install -m ${CONFMODE} xorg/xorg.conf.new ${EXTDIR}/X11/xorg.conf
#	install -m ${CONFMODE} xorg/.xinitrc /etc/skel

install-slim:
	install -m ${CONFMODE} slim/slim.conf ${EXTDIR}/slim.conf
	install -m ${CONFMODE} slim/xinitrc* ${EXTDIR}/X11/xinit/
	install -m 755 slim/slim ${EXTDIR}/rc.d/init.d/
