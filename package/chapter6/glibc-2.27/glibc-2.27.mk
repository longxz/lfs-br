GLIBC_2_27_URL=http://ftp.gnu.org/gnu/glibc/glibc-2.27.tar.xz
GLIBC_2_27_SOURCE=$(LFS-SRC)/glibc-2.27.tar.xz

define GLIBC_2_27_SOURCE_CMDS  
	@echo "GLIBC_2_27_TARGET_SOURCE"
endef

define GLIBC_2_27_CONFIGURE_CMDS
	cd $(GLIBC_2_27_DIR); \
	mkdir -v build; \
	cd build; \
	../configure \
		--prefix=/tools \
		--host=$$LFS_TGT \
		--build=$$(../scripts/config.guess) \
		--enable-kernel=3.2 \
		--with-headers=/tools/include \
		libc_cv_forced_unwind=yes \
		libc_cv_c_cleanup=yes
endef

define GLIBC_2_27_BUILD_CMDS
	cd $(GLIBC_2_27_DIR); \
	cd build; \
	make
endef

define GLIBC_2_27_INSTALL_TARGET_CMDS
	cd $(GLIBC_2_27_DIR); \
	cd build; \
	make install; \
	echo 'int main(){}' > dummy.c; \
	$$LFS_TGT-gcc dummy.c; \
	readelf -l a.out | grep ': /tools'; \
	rm -v dummy.c a.out
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))