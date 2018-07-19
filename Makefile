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
charpter5:
	chown -R root:root $LFS/tools
charpter6:
endif

ifeq ($(CHARPTER),6)
include package/glibc-2.27/glibc-2.27.mk
charpter5:
charpter6:
	echo "action charpter6"
endif

.PHONY: target-finalize
target-finalize: $(PACKAGES) charpter5 charpter6

.PHONY: prepare
prepare:

.PHONY: world
world: prepare target-finalize
	@echo "make world"

.PHONY: all
all: world
	@echo "make all"
