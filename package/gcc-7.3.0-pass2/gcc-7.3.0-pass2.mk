GCC_7_3_0_PASS2_URL=http://ftp.gnu.org/gnu/gcc/gcc-7.3.0/gcc-7.3.0.tar.xz
GCC_7_3_0_PASS2_SOURCE=$(LFS-SRC)/gcc-7.3.0.tar.xz

define GCC_7_3_0_PASS2_SOURCE_CMDS  
	@echo "GCC_7_3_0_PASS2_TARGET_SOURCE"
endef

define GCC_7_3_0_PASS2_CONFIGURE_CMDS
	cd $(GCC_7_3_0_PASS2_DIR); \
	cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
		`dirname $$($$LFS_TGT-gcc -print-libgcc-file-name)`/include-fixed/limits.h

	cd $(GCC_7_3_0_PASS2_DIR); \
	for file in gcc/config/{linux,i386/linux{,64}}.h; \
	do	\
		cp -uv $$file{,.orig}; \
		sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
			-e 's@/usr@/tools@g' $$file.orig > $$file; \
		echo -e '#undef STANDARD_STARTFILE_PREFIX_1\n \
				#undef STANDARD_STARTFILE_PREFIX_2\n \
				#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"\n \
				#define STANDARD_STARTFILE_PREFIX_2 ""' >> $$file; \
		touch $$file.orig; \
	done

	cd $(GCC_7_3_0_PASS2_DIR); \
	case $$(uname -m) in \
	x86_64) \
		sed -e '/m64=/s/lib64/lib/' \
		-i.orig gcc/config/i386/t-linux64 \
		;; \
	esac
	
	-cd $(GCC_7_3_0_PASS2_DIR); \
	tar -xf ../mpfr-4.0.1.tar.xz; \
	mv -v mpfr-4.0.1 mpfr; \
	tar -xf ../gmp-6.1.2.tar.xz; \
	mv -v gmp-6.1.2 gmp; \
	tar -xf ../mpc-1.1.0.tar.gz; \
	mv -v mpc-1.1.0 mpc;

	cd $(GCC_7_3_0_PASS2_DIR); \
	mkdir -v build; \
	cd build; \
	CC=$$LFS_TGT-gcc; \
	CXX=$$LFS_TGT-g++; \
	AR=$$LFS_TGT-ar; \
	RANLIB=$$LFS_TGT-ranlib; \
	../configure \
		--prefix=/tools \
		--with-local-prefix=/tools \
		--with-native-system-header-dir=/tools/include \
		--enable-languages=c,c++ \
		--disable-libstdcxx-pch \
		--disable-multilib \
		--disable-bootstrap \
		--disable-libgomp

endef

define GCC_7_3_0_PASS2_BUILD_CMDS
	cd $(GCC_7_3_0_PASS2_DIR); \
	cd build; \
	make
endef

define GCC_7_3_0_PASS2_INSTALL_TARGET_CMDS
	cd $(GCC_7_3_0_PASS2_DIR); \
	cd build; \
	make install; \
	ln -sv gcc /tools/bin/cc; \
	echo 'int main(){}' > dummy.c; \
	$$LFS_TGT-gcc dummy.c; \
	readelf -l a.out | grep ': /tools'; \
	rm -v dummy.c a.out
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))