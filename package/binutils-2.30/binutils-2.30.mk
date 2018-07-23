# Binutils-2.30 - Pass 1
BINUTILS_2_30_URL=http://ftp.gnu.org/gnu/binutils/binutils-2.30.tar.xz
BINUTILS_2_30_SOURCE=$(LFS-SRC)/binutils-2.30.tar.xz

define BINUTILS_2_30_SOURCE_CMDS  
	@echo "BINUTILS_2_30_TARGET_SOURCE"
endef

define BINUTILS_2_30_CONFIGURE_CMDS
	cd $(BINUTILS_2_30_DIR); \
	mkdir -v build; \
	cd build; \
	../configure --prefix=/tools \
		--with-sysroot=$$LFS \
		--with-lib-path=/tools/lib \
		--target=$$LFS_TGT \
		--disable-nls \
		--disable-werror
endef

define BINUTILS_2_30_BUILD_CMDS
	cd $(BINUTILS_2_30_DIR); \
	cd build; \
	make
endef

define BINUTILS_2_30_INSTALL_TARGET_CMDS
	-case $$(uname -m) in \
		x86_64) mkdir -v /tools/lib && ln -sv lib /tools/lib64 ;; \
	esac 

	cd $(BINUTILS_2_30_DIR); \
	cd build; \
	make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))
