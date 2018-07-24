# declare before package include scripts/generic-package.mk

LFS=/mnt/lfs
LFS-SRC=$(LFS)/sources
BUILD_DIR=$(LFS)/sources

PACKAGES :=
PACKAGES_ALL :=

CHARPTER=5

include scripts/utils.mk

include package/pkg-utils.mk
include package/pkg-generic.mk

chapter1:
	echo "Just Introduction" | tee -a chapter1.log

# make need build-essential installed
chapter2:
	sudo apt-get install -y binutils bison m4 texinfo xz-utils gawk gcc g++ | tee -a .chapter2.log
	bash version-check.sh | tee -a .chapter2.log
	sudo ln -fs /bin/bash /bin/sh | tee -a .chapter2.log
	echo "Please create partitions manually!!!" | tee -a .chapter2.log

	# check partitions
	[[ -e $(LFS) ]] || exit 1

chapter3:
	# get sources package
	sudo mkdir -v $(LFS)/sources | tee -a .chapter3.log
	sudo chmod -v a+wt $(LFS)/sources | tee -a .chapter3.log
	sudo tar xf sources.tar -C $(LFS) | tee -a .chapter3.log
	pushd $(LFS)/sources; \
	md5sum -c md5sums | tee -a .chapter3.log; \
	popd; \ 

chapter4:
	-sudo mkdir -v $(LFS)/tools  | tee -a .chapter4.log
	-sudo ln -sv $(LFS)/tools /  | tee -a .chapter4.log
	-sudo groupadd lfs  | tee -a .chapter4.log
	-sudo useradd -s /bin/bash -g lfs -m -k /dev/null lfs  | tee -a .chapter4.log
	-sudo passwd lfs  | tee -a .chapter4.log
	-sudo chown -v lfs $(LFS)/tools  | tee -a .chapter4.log
	-sudo chown -v lfs $(LFS)/sources | tee -a .chapter4.log

	echo "Please su - lfs, and create bash_profile and bashrc !!!" | tee -a .chapter4.log

ifeq ($(CHARPTER),5)
include package/binutils-2.30/binutils-2.30.mk
include package/gcc-7.3.0/gcc-7.3.0.mk
include package/linux-4.15.3/linux-4.15.3.mk
include package/glibc-2.27/glibc-2.27.mk
include package/libstdc++-7.3.0/libstdc++-7.3.0.mk
include package/binutils-2.30-pass2/binutils-2.30-pass2.mk
include package/gcc-7.3.0-pass2/gcc-7.3.0-pass2.mk
include package/tcl8.6.8-src/tcl8.6.8-src.mk
include package/expect5.45.4/expect5.45.4.mk
include package/dejagnu-1.6.1/dejagnu-1.6.1.mk
include package/m4-1.4.18/m4-1.4.18.mk
include package/ncurses-6.1/ncurses-6.1.mk
include package/bash-4.4.18/bash-4.4.18.mk
include package/bison-3.0.4/bison-3.0.4.mk
include package/bzip2-1.0.6/bzip2-1.0.6.mk
include package/coreutils-8.29/coreutils-8.29.mk
include package/diffutils-3.6/diffutils-3.6.mk
include package/file-5.32/file-5.32.mk
include package/findutils-4.6.0/findutils-4.6.0.mk
include package/gawk-4.2.0/gawk-4.2.0.mk
include package/gettext-0.19.8.1/gettext-0.19.8.1.mk
include package/grep-3.1/grep-3.1.mk
include package/gzip-1.9/gzip-1.9.mk
include package/make-4.2.1/make-4.2.1.mk
include package/patch-2.7.6/patch-2.7.6.mk
include package/perl-5.26.1/perl-5.26.1.mk
include package/sed-4.4/sed-4.4.mk
include package/tar-1.30/tar-1.30.mk
include package/texinfo-6.5/texinfo-6.5.mk
include package/util-linux-2.31.1/util-linux-2.31.1.mk
include package/xz-5.2.3/xz-5.2.3.mk
endif

ifeq ($(CHARPTER),6)
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
