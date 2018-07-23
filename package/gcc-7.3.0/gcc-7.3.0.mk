GCC_7_3_0_URL=http://ftp.gnu.org/gnu/gcc/gcc-7.3.0/gcc-7.3.0.tar.xz
GCC_7_3_0_SOURCE=$(LFS-SRC)/gcc-7.3.0.tar.xz

define GCC_7_3_0_SOURCE_CMDS  
	@echo "GCC_7_3_0_TARGET_SOURCE"
endef

define GCC_7_3_0_CONFIGURE_CMDS
	-cd $(GCC_7_3_0_DIR); \
	tar -xf ../mpfr-4.0.1.tar.xz; \
	mv -v mpfr-4.0.1 mpfr; \
	tar -xf ../gmp-6.1.2.tar.xz; \
	mv -v gmp-6.1.2 gmp; \
	tar -xf ../mpc-1.1.0.tar.gz; \
	mv -v mpc-1.1.0 mpc;

	cd $(GCC_7_3_0_DIR); \
	for file in gcc/config/{linux,i386/linux{,64}}.h; \
	do	\
		cp -uv $$file{,.orig}; \
		sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
			-e 's@/usr@/tools@g' $$file.orig > $$file; \
		echo ' \
#undef STANDARD_STARTFILE_PREFIX_1 \
#undef STANDARD_STARTFILE_PREFIX_2 \
#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/" \
#define STANDARD_STARTFILE_PREFIX_2 ""' >> $$file; \
		touch $$file.orig; \
	done

	cd $(GCC_7_3_0_DIR); \
	case $$(uname -m) in \
	x86_64) \
		sed -e '/m64=/s/lib64/lib/' \
		-i.orig gcc/config/i386/t-linux64 \
		;; \
	esac

	cd $(GCC_7_3_0_DIR); \
	mkdir -v build; \
	cd build; \
	../configure \
		--target=$$LFS_TGT \
		--prefix=/tools \
		--with-glibc-version=2.11 \
		--with-sysroot=$$LFS \
		--with-newlib \
		--without-headers \
		--with-local-prefix=/tools \
		--with-native-system-header-dir=/tools/include \
		--disable-nls \
		--disable-shared \
		--disable-multilib \
		--disable-decimal-float \
		--disable-threads \
		--disable-libatomic \
		--disable-libgomp \
		--disable-libmpx \
		--disable-libquadmath \
		--disable-libssp \
		--disable-libvtv \
		--disable-libstdcxx \
		--enable-languages=c,c++
endef

define GCC_7_3_0_BUILD_CMDS
	cd $(GCC_7_3_0_DIR); \
	cd build; \
	make
endef

define GCC_7_3_0_INSTALL_TARGET_CMDS
	cd $(GCC_7_3_0_DIR); \
	cd build; \
	make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))