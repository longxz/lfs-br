GCC_7_3_0_URL=http://ftp.gnu.org/gnu/gcc/gcc-7.3.0/gcc-7.3.0.tar.xz
GCC_7_3_0_SOURCE=$(LFS-SRC)/gcc-7.3.0.tar.xz

define GCC_7_3_0_SOURCE_CMDS  
	@echo "GCC_7_3_0_TARGET_SOURCE"
endef

define GCC_7_3_0_CONFIGURE_CMDS
	-cd $(GCC_7_3_0_DIR); \
	case $$(uname -m) in \
		x86_64) \
			sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64  \
		;; \
	esac

	cd $(GCC_7_3_0_DIR); \
	rm -f /usr/lib/gcc; \
	mkdir -v build; \
	cd build; \
	SED=sed; \
	../configure --prefix=/usr \
		--enable-languages=c,c++ \
		--disable-multilib \
		--disable-bootstrap
endef

define GCC_7_3_0_BUILD_CMDS
	cd $(GCC_7_3_0_DIR); \
	cd build; \
	make
endef

define GCC_7_3_0_INSTALL_TARGET_CMDS
	cd $(GCC_7_3_0_DIR); \
	cd build; \
	ulimit -s 32768; \
	make -k check; \
	../contrib/test_summary; \
	make install; \
	ln -sv ../usr/bin/cpp /lib; \
	ln -sv gcc /usr/bin/cc; \
	install -v -dm755 /usr/lib/bfd-plugins; \
	ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/7.3.0/liblto_plugin.so  /usr/lib/bfd-plugins/; \
	echo 'int main(){}' > dummy.c; \
	cc dummy.c -v -Wl,--verbose &> dummy.log; \
	readelf -l a.out | grep ': /lib'; \
	grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log; \
	grep -B4 '^ /usr/include' dummy.log; \
	grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'; \
	grep "/lib.*/libc.so.6 " dummy.log; \
	grep found dummy.log; \
	rm -v dummy.c a.out dummy.log; \
	mkdir -pv /usr/share/gdb/auto-load/usr/lib; \
	mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))