LIBSTDC++_7_3_0_URL=http://ftp.gnu.org/gnu/gcc/gcc-7.3.0/gcc-7.3.0.tar.xz
LIBSTDC++_7_3_0_SOURCE=$(LFS-SRC)/gcc-7.3.0.tar.xz

define LIBSTDC++_7_3_0_EXTRACT_CMDS  
	@echo "LIBSTDC++_7_3_0_EXTRACT_CMDS"
endef

define LIBSTDC++_7_3_0_SOURCE_CMDS  
	@echo "LIBSTDC++_7_3_0_TARGET_SOURCE"
endef

define LIBSTDC++_7_3_0_CONFIGURE_CMDS
	cd $(GCC_7_3_0_DIR); \
	mkdir -v build; \
	cd build; \
	../libstdc++-v3/configure \
		--host=$$LFS_TGT \
		--prefix=/tools \
		--disable-multilib \
		--disable-nls \
		--disable-libstdcxx-threads \
		--disable-libstdcxx-pch \
		--with-gxx-include-dir=/tools/$$LFS_TGT/include/c++/7.3.0
endef

define LIBSTDC++_7_3_0_BUILD_CMDS
	cd $(GCC_7_3_0_DIR); \
	cd build; \
	make
endef

define LIBSTDC++_7_3_0_INSTALL_TARGET_CMDS
	cd $(GCC_7_3_0_DIR); \
	cd build; \
	make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))