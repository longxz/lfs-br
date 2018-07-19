# Binutils-2.30 - Pass 2
BINUTILS_2_30_PASS2_URL=http://ftp.gnu.org/gnu/binutils/binutils-2.30.tar.xz
BINUTILS_2_30_PASS2_SOURCE=$(LFS-SRC)/binutils-2.30.tar.xz

define BINUTILS_2_30_PASS2_SOURCE_CMDS  
	@echo "BINUTILS_2_30_PASS2_TARGET_SOURCE"
endef

define BINUTILS_2_30_PASS2_CONFIGURE_CMDS
	cd $(BINUTILS_2_30_PASS2_DIR); \
	mkdir -v build; \
	cd build; \
	CC=$$LFS_TGT-gcc; \
	AR=$$LFS_TGT-ar; \
	RANLIB=$$LFS_TGT-ranlib; \
	../configure \
		--prefix=/tools \
		--disable-nls \
		--disable-werror \
		--with-lib-path=/tools/lib \
		--with-sysroot
endef

define BINUTILS_2_30_PASS2_BUILD_CMDS
	cd $(BINUTILS_2_30_PASS2_DIR); \
	cd build; \
	make
endef

define BINUTILS_2_30_PASS2_INSTALL_TARGET_CMDS
	cd $(BINUTILS_2_30_PASS2_DIR); \
	cd build; \
	make install; \
	make -C ld clean; \
	make -C ld LIB_PATH=/usr/lib:/lib; \
	cp -v ld/ld-new /tools/bin
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))
