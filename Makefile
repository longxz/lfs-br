# declare before package include scripts/generic-package.mk

LFS-SRC=/mnt/lfs/sources
BUILD_DIR=/mnt/lfs/sources

PACKAGES :=
PACKAGES_ALL :=

CHARPTER=5

include scripts/utils.mk

include package/pkg-utils.mk
include package/pkg-generic.mk

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
include package/linux-4.15.3/linux-4.15.3.mk
include package/man-pages-4.15/man-pages-4.15.mk
include package/glibc-2.27/glibc-2.27.mk
include package/zlib-1.2.11/zlib-1.2.11.mk
include package/file-5.32/file-5.32.mk
include package/readline-7.0/readline-7.0.mk
include package/m4-1.4.18/m4-1.4.18.mk
include package/bc-1.07.1/bc-1.07.1.mk
include package/binutils-2.30/binutils-2.30.mk
include package/gmp-6.1.2/gmp-6.1.2.mk
include package/mpfr-4.0.1/mpfr-4.0.1.mk
include package/mpc-1.1.0/mpc-1.1.0.mk
include package/gcc-7.3.0/gcc-7.3.0.mk
include package/bzip2-1.0.6/bzip2-1.0.6.mk
include package/pkg-config-0.29.2/pkg-config-0.29.2.mk
include package/ncurses-6.1/ncurses-6.1.mk
include package/attr-2.4.47.src/attr-2.4.47.src.mk
include package/acl-2.2.52.src/acl-2.2.52.src.mk
include package/libcap-2.25/libcap-2.25.mk
include package/sed-4.4/sed-4.4.mk
include package/shadow-4.5/shadow-4.5.mk
include package/psmisc-23.1/psmisc-23.1.mk
include package/iana-etc-2.30/iana-etc-2.30.mk
include package/bison-3.0.4/bison-3.0.4.mk
include package/flex-2.6.4/flex-2.6.4.mk
include package/grep-3.1/grep-3.1.mk
include package/bash-4.4.18/bash-4.4.18.mk
include package/libtool-2.4.6/libtool-2.4.6.mk
include package/gdbm-1.14.1/gdbm-1.14.1.mk
include package/gperf-3.1/gperf-3.1.mk
include package/expat-2.2.5/expat-2.2.5.mk
include package/inetutils-1.9.4/inetutils-1.9.4.mk
include package/perl-5.26.1/perl-5.26.1.mk
include package/XML-Parser-2.44/XML-Parser-2.44.mk
include package/intltool-0.51.0/intltool-0.51.0.mk
include package/autoconf-2.69/autoconf-2.69.mk
include package/automake-1.15.1/automake-1.15.1.mk
include package/xz-5.2.3/xz-5.2.3.mk
include package/kmod-25/kmod-25.mk
include package/gettext-0.19.8.1/gettext-0.19.8.1.mk
include package/libffi-3.2.1/libffi-3.2.1.mk
include package/openssl-1.1.0g/openssl-1.1.0g.mk
include package/Python-3.6.4/Python-3.6.4.mk
include package/ninja-1.8.2/ninja-1.8.2.mk
include package/meson-0.44.0/meson-0.44.0.mk
include package/procps-ng-3.3.12/procps-ng-3.3.12.mk
include package/elfutils-0.170/elfutils-0.170.mk
include package/coreutils-8.29/coreutils-8.29.mk
include package/check-0.12.0/check-0.12.0.mk
include package/diffutils-3.6/diffutils-3.6.mk
include package/gawk-4.2.0/gawk-4.2.0.mk
include package/findutils-4.6.0/findutils-4.6.0.mk
include package/groff-1.22.3/groff-1.22.3.mk
include package/grub-2.02/grub-2.02.mk
include package/less-530/less-530.mk
include package/gzip-1.9/gzip-1.9.mk
include package/iproute2-4.15.0/iproute2-4.15.0.mk
include package/kbd-2.0.4/kbd-2.0.4.mk
include package/libpipeline-1.5.0/libpipeline-1.5.0.mk
include package/make-4.2.1/make-4.2.1.mk
include package/patch-2.7.6/patch-2.7.6.mk
include package/sysklogd-1.5.1/sysklogd-1.5.1.mk
include package/sysvinit-2.88dsf/sysvinit-2.88dsf.mk
include package/eudev-3.2.5/eudev-3.2.5.mk
include package/util-linux-2.31.1/util-linux-2.31.1.mk
include package/man-db-2.8.1/man-db-2.8.1.mk
include package/tar-1.30/tar-1.30.mk
include package/texinfo-6.5/texinfo-6.5.mk
include package/vim-8.0.586/vim-8.0.586.mk
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
