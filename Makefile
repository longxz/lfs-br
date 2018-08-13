
# common
empty :=

# CHAPTER
CHAPTER := 5

LFS := /mnt/lfs
LFS-SRC := $(LFS)/sources
BUILD_DIR:=$(LFS)/sources

ifeq ($(CHAPTER),6)
LFS := $(empty)
LFS-SRC := /sources.ch6
BUILD_DIR := /sources.ch6
endif

$(info $(LFS))
$(info $(LFS-SRC))
$(info $(BUILD_DIR))

# partitions
ROOT_PART=/dev/sdb1
SWAP_PART=/dev/sdb2

# packages
PACKAGES :=
PACKAGES_ALL :=

include scripts/utils.mk
include scripts/pkg-utils.mk
include scripts/pkg-generic.mk

test:
	@echo "target: test..."
	@echo "LFS: $$LFS"
	@echo "LFS_TGT: $$LFS_TGT"

# chapter1-4, su, as root
chapter1:
	@echo "target: chapter1..."
	@echo "Just Introduction" | tee -a .chapter1.log

# sudo apt install -y build-essential
chapter2.2:
	@echo "target: chapter2.2..."
	apt-get install -y binutils bison m4 texinfo xz-utils gawk gcc g++ | tee -a .chapter2.log
	ln -fs /bin/bash /bin/sh | tee -a .chapter2.log
	bash version-check.sh | tee -a .chapter2.log
	
chapter2.4:
	@echo "target: chapter2.4..."
	@echo "Please create partitions manually!!!"
	@echo "example: cfdisk /dev/sdb"

chapter2.5:
	@echo "target: chapter2.5..."
	mkfs -v -t ext4 $(ROOT_PART)
	mkswap $(SWAP_PART)

chapter2.6:
	@echo "target: chapter2.6..."
	@echo "export LFS=/mnt/lfs" >> ~/.bashrc
	LFS=/mnt/lfs; mkdir -pv $$LFS
	echo "$(ROOT_PART) /mnt/lfs ext4 defaults 1 1" >> /etc/fstab
	/sbin/swapon -v $(SWAP_PART)
	@echo "Important !!! : Please source ~/.bashrc !!!"

chapter3:
	@echo "target: chapter3..."
	@if [ ! -f ../sources.tar.gz ]; then echo "Please prepare sources package!!!"; exit 1; fi 
	mkdir -pv $(LFS)/sources | tee -a .chapter3.log
	chmod -v a+wt $(LFS)/sources | tee -a .chapter3.log
	tar xf ../sources.tar.gz -C $(LFS) | tee -a .chapter3.log
	cp md5sums $(LFS)/sources
	pushd $(LFS)/sources; \
	md5sum -c md5sums | tee -a .chapter3.log; \
	popd;

	mkdir -pv $(LFS)/sources.ch6 | tee -a .chapter3.log
	chmod -v a+wt $(LFS)/sources.ch6 | tee -a .chapter3.log
	tar xf ../sources.tar.gz --strip-components=1 -C $(LFS)/sources.ch6 | tee -a .chapter3.log
	cp md5sums $(LFS)/sources.ch6
	pushd $(LFS)/sources.ch6; \
	md5sum -c md5sums | tee -a .chapter3.log; \
	popd;

chapter4:
	@echo "target: chapter4..."
	@mkdir -pv $(LFS)/tools  | tee -a .chapter4.log
	-ln -sv $(LFS)/tools /  | tee -a .chapter4.log
	-groupadd lfs  | tee -a .chapter4.log
	-useradd -s /bin/bash -g lfs -m -k /dev/null lfs  | tee -a .chapter4.log
	-passwd lfs  | tee -a .chapter4.log
	-chown -v lfs $(LFS)/tools  | tee -a .chapter4.log
	-chown -v lfs $(LFS)/sources | tee -a .chapter4.log
	@echo "Important !!! : Please su - lfs"

# su - lfs
chapter4.4:
	@echo "target: chapter4.4..."
	-cp ./catfiles/chapter4/bashrc ~/.bashrc
	-cp ./catfiles/chapter4/bash_profile ~/.bash_profile
	@echo "Important !!! : Please source ~/.bashrc"

# su, as root
chapter5.36:
	@echo "target: chapter5.36 ..."
	chown -R root:root $(LFS)/tools

chapter6.2:
	@echo "target: chapter6.2 ..."
	-mkdir -pv $$LFS/{dev,proc,sys,run}
	-mknod -m 600 $$LFS/dev/console c 5 1
	-mknod -m 666 $$LFS/dev/null c 1 3
	-mount -v --bind /dev $$LFS/dev
	-mount -vt devpts devpts $$LFS/dev/pts -o gid=5,mode=620
	-mount -vt proc proc $$LFS/proc
	-mount -vt sysfs sysfs $$LFS/sys
	-mount -vt tmpfs tmpfs $$LFS/run
	if [ -h $$LFS/dev/shm ]; then \
 		mkdir -pv $$LFS/$$(readlink $$LFS/dev/shm); \
	fi;\

chapter6.4:
# chroot "$LFS" /tools/bin/env -i \
# 	HOME=/root \
# 	TERM="$TERM" \
# 	PS1='(lfs chroot) \u:\w\$ ' \
# 	PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
# 	/tools/bin/bash --login +h
	@echo "target: chapter6.4 ..."
	@echo "Please chroot !!!"

chapter6.5:
	@echo "target: chapter6.5 ..."
	-mkdir -pv /{bin,boot,etc/{opt,sysconfig},home,lib/firmware,mnt,opt}
	-mkdir -pv /{media/{floppy,cdrom},sbin,srv,var}
	-install -dv -m 0750 /root
	-install -dv -m 1777 /tmp /var/tmp
	-mkdir -pv /usr/{,local/}{bin,include,lib,sbin,src}
	-mkdir -pv /usr/{,local/}share/{color,dict,doc,info,locale,man}
	-mkdir -v /usr/{,local/}share/{misc,terminfo,zoneinfo}
	-mkdir -v /usr/libexec
	-mkdir -pv /usr/{,local/}share/man/man{1..8}
	case $(uname -m) in \
	 x86_64) mkdir -v /lib64 ;; \
	esac
	-mkdir -v /var/{log,mail,spool}
	-ln -sv /run /var/run
	-ln -sv /run/lock /var/lock
	-mkdir -pv /var/{opt,cache,lib/{color,misc,locate},local}

chapter6.6:
	@echo "target: chapter6.6 ..."
	-ln -sv /tools/bin/{bash,cat,dd,echo,ln,pwd,rm,stty} /bin
	-ln -sv /tools/bin/{install,perl} /usr/bin
	-ln -sv /tools/lib/libgcc_s.so{,.1} /usr/lib
	-ln -sv /tools/lib/libstdc++.{a,so{,.6}} /usr/lib
	-ln -sv bash /bin/sh
	-ln -sv /proc/self/mounts /etc/mtab
	-cp ./catfiles/chapter6/passwd /etc/passwd
	-cp ./catfiles/chapter6/group /etc/group

	exec /tools/bin/bash --login +h

	-touch /var/log/{btmp,lastlog,faillog,wtmp}
	-chgrp -v utmp /var/log/lastlog
	-chmod -v 664 /var/log/lastlog
	-chmod -v 600 /var/log/btmp

chapter7:
	@echo "target: chapter7 ..."
	-cp ./catfiles/chapter7/etc-udev-rules.d-83-duplicate_devs.rules /etc/udev/rules.d/83-duplicate_devs.rules
	-cp ./catfiles/chapter7/etc-sysconfig-ifconfig.eth0	/etc/sysconfig/ifconfig.eth0
	-cp ./catfiles/chapter7/etc-resolv.conf /etc/resolv.conf
	-cp ./catfiles/chapter7/etc-hosts /etc/hosts
	-cp ./catfiles/chapter7/etc-inittab /etc/inittab
	-cp ./catfiles/chapter7/etc-sysconfig-clock /etc/sysconfig/clock
	-cp ./catfiles/chapter7/etc-sysconfig-console /etc/sysconfig/console
	-cp ./catfiles/chapter7/etc-profile /etc/profile
	-cp ./catfiles/chapter7/etc-inputrc /etc/inputrc
	-cp ./catfiles/chapter7/etc-shells /etc/shells

chapter8:
	@echo "target: chapter8 ..."
	-cp ./catfiles/chapter8/etc-fstab /etc/fstab
	-cp ./catfiles/chapter8/etc-modprobe.d-usb.conf /etc/modprobe.d/usb.conf
	-cp ./catfiles/chapter8/boot-grub-grub.cfg /boot/grub/grub.cfg
chapter9:
	@echo "target: chapter9 ..."
	-cp ./catfiles/chapter9/etc-lsb-release /etc/lsb-release

ifeq ($(CHAPTER),D5)
include package/chapter5/binutils-2.30/binutils-2.30.mk
endif

# su - lfs
ifeq ($(CHAPTER),5)
include package/chapter5/binutils-2.30/binutils-2.30.mk
include package/chapter5/gcc-7.3.0/gcc-7.3.0.mk
include package/chapter5/linux-4.15.3/linux-4.15.3.mk
include package/chapter5/glibc-2.27/glibc-2.27.mk
include package/chapter5/libstdc++-7.3.0/libstdc++-7.3.0.mk
include package/chapter5/binutils-2.30-pass2/binutils-2.30-pass2.mk
include package/chapter5/gcc-7.3.0-pass2/gcc-7.3.0-pass2.mk
include package/chapter5/tcl8.6.8-src/tcl8.6.8-src.mk
include package/chapter5/expect5.45.4/expect5.45.4.mk
include package/chapter5/dejagnu-1.6.1/dejagnu-1.6.1.mk
include package/chapter5/m4-1.4.18/m4-1.4.18.mk
include package/chapter5/ncurses-6.1/ncurses-6.1.mk
include package/chapter5/bash-4.4.18/bash-4.4.18.mk
include package/chapter5/bison-3.0.4/bison-3.0.4.mk
include package/chapter5/bzip2-1.0.6/bzip2-1.0.6.mk
include package/chapter5/coreutils-8.29/coreutils-8.29.mk
include package/chapter5/diffutils-3.6/diffutils-3.6.mk
include package/chapter5/file-5.32/file-5.32.mk
include package/chapter5/findutils-4.6.0/findutils-4.6.0.mk
include package/chapter5/gawk-4.2.0/gawk-4.2.0.mk
include package/chapter5/gettext-0.19.8.1/gettext-0.19.8.1.mk
include package/chapter5/grep-3.1/grep-3.1.mk
include package/chapter5/gzip-1.9/gzip-1.9.mk
include package/chapter5/make-4.2.1/make-4.2.1.mk
include package/chapter5/patch-2.7.6/patch-2.7.6.mk
include package/chapter5/perl-5.26.1/perl-5.26.1.mk
include package/chapter5/sed-4.4/sed-4.4.mk
include package/chapter5/tar-1.30/tar-1.30.mk
include package/chapter5/texinfo-6.5/texinfo-6.5.mk
include package/chapter5/util-linux-2.31.1/util-linux-2.31.1.mk
include package/chapter5/xz-5.2.3/xz-5.2.3.mk
endif

ifeq ($(CHAPTER),D6)
include package/chapter6/linux-4.15.3/linux-4.15.3.mk
endif

# entering chroot
ifeq ($(CHAPTER),6)
include package/chapter6/linux-4.15.3/linux-4.15.3.mk
include package/chapter6/man-pages-4.15/man-pages-4.15.mk
include package/chapter6/glibc-2.27/glibc-2.27.mk
include package/chapter6/zlib-1.2.11/zlib-1.2.11.mk
include package/chapter6/file-5.32/file-5.32.mk
include package/chapter6/readline-7.0/readline-7.0.mk
include package/chapter6/m4-1.4.18/m4-1.4.18.mk
include package/chapter6/bc-1.07.1/bc-1.07.1.mk
include package/chapter6/binutils-2.30/binutils-2.30.mk
include package/chapter6/gmp-6.1.2/gmp-6.1.2.mk
include package/chapter6/mpfr-4.0.1/mpfr-4.0.1.mk
include package/chapter6/mpc-1.1.0/mpc-1.1.0.mk
include package/chapter6/gcc-7.3.0/gcc-7.3.0.mk
include package/chapter6/bzip2-1.0.6/bzip2-1.0.6.mk
include package/chapter6/pkg-config-0.29.2/pkg-config-0.29.2.mk
include package/chapter6/ncurses-6.1/ncurses-6.1.mk
include package/chapter6/attr-2.4.47.src/attr-2.4.47.src.mk
include package/chapter6/acl-2.2.52.src/acl-2.2.52.src.mk
include package/chapter6/libcap-2.25/libcap-2.25.mk
include package/chapter6/sed-4.4/sed-4.4.mk
include package/chapter6/shadow-4.5/shadow-4.5.mk
include package/chapter6/psmisc-23.1/psmisc-23.1.mk
include package/chapter6/iana-etc-2.30/iana-etc-2.30.mk
include package/chapter6/bison-3.0.4/bison-3.0.4.mk
include package/chapter6/flex-2.6.4/flex-2.6.4.mk
include package/chapter6/grep-3.1/grep-3.1.mk
include package/chapter6/bash-4.4.18/bash-4.4.18.mk
include package/chapter6/libtool-2.4.6/libtool-2.4.6.mk
include package/chapter6/gdbm-1.14.1/gdbm-1.14.1.mk
include package/chapter6/gperf-3.1/gperf-3.1.mk
include package/chapter6/expat-2.2.5/expat-2.2.5.mk
include package/chapter6/inetutils-1.9.4/inetutils-1.9.4.mk
include package/chapter6/perl-5.26.1/perl-5.26.1.mk
include package/chapter6/XML-Parser-2.44/XML-Parser-2.44.mk
include package/chapter6/intltool-0.51.0/intltool-0.51.0.mk
include package/chapter6/autoconf-2.69/autoconf-2.69.mk
include package/chapter6/automake-1.15.1/automake-1.15.1.mk
include package/chapter6/xz-5.2.3/xz-5.2.3.mk
include package/chapter6/kmod-25/kmod-25.mk
include package/chapter6/gettext-0.19.8.1/gettext-0.19.8.1.mk
include package/chapter6/libffi-3.2.1/libffi-3.2.1.mk
include package/chapter6/openssl-1.1.0g/openssl-1.1.0g.mk
include package/chapter6/Python-3.6.4/Python-3.6.4.mk
include package/chapter6/ninja-1.8.2/ninja-1.8.2.mk
include package/chapter6/meson-0.44.0/meson-0.44.0.mk
include package/chapter6/procps-ng-3.3.12/procps-ng-3.3.12.mk
include package/chapter6/elfutils-0.170/elfutils-0.170.mk
include package/chapter6/coreutils-8.29/coreutils-8.29.mk
include package/chapter6/check-0.12.0/check-0.12.0.mk
include package/chapter6/diffutils-3.6/diffutils-3.6.mk
include package/chapter6/gawk-4.2.0/gawk-4.2.0.mk
include package/chapter6/findutils-4.6.0/findutils-4.6.0.mk
include package/chapter6/groff-1.22.3/groff-1.22.3.mk
include package/chapter6/grub-2.02/grub-2.02.mk
include package/chapter6/less-530/less-530.mk
include package/chapter6/gzip-1.9/gzip-1.9.mk
include package/chapter6/iproute2-4.15.0/iproute2-4.15.0.mk
include package/chapter6/kbd-2.0.4/kbd-2.0.4.mk
include package/chapter6/libpipeline-1.5.0/libpipeline-1.5.0.mk
include package/chapter6/make-4.2.1/make-4.2.1.mk
include package/chapter6/patch-2.7.6/patch-2.7.6.mk
include package/chapter6/sysklogd-1.5.1/sysklogd-1.5.1.mk
include package/chapter6/sysvinit-2.88dsf/sysvinit-2.88dsf.mk
include package/chapter6/eudev-3.2.5/eudev-3.2.5.mk
include package/chapter6/util-linux-2.31.1/util-linux-2.31.1.mk
include package/chapter6/man-db-2.8.1/man-db-2.8.1.mk
include package/chapter6/tar-1.30/tar-1.30.mk
include package/chapter6/texinfo-6.5/texinfo-6.5.mk
include package/chapter6/vim-8.0.586/vim-8.0.586.mk
endif

.PHONY: target-finalize
target-finalize: $(PACKAGES) 

.PHONY: prepare
prepare:

.PHONY: world
world: prepare target-finalize
	@echo "make world"

.PHONY: all
all: world
	@echo "make all"
