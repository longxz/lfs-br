GLIBC_2_27_URL=http://ftp.gnu.org/gnu/glibc/glibc-2.27.tar.xz
GLIBC_2_27_SOURCE=$(LFS-SRC)/glibc-2.27.tar.xz

define GLIBC_2_27_SOURCE_CMDS  
	@echo "GLIBC_2_27_TARGET_SOURCE"
endef

define GLIBC_2_27_CONFIGURE_CMDS
	cd $(GLIBC_2_27_DIR); \
	patch -Np1 -i ../glibc-2.27-fhs-1.patch; \
	ln -sfv /tools/lib/gcc /usr/lib; \
	case $$(uname -m) in \
		i?86)  \
			GCC_INCDIR=/usr/lib/gcc/$$(uname -m)-pc-linux-gnu/7.3.0/include;  \
			ln -sfv ld-linux.so.2 /lib/ld-lsb.so.3; \
			;; \
		x86_64) \
			GCC_INCDIR=/usr/lib/gcc/x86_64-pc-linux-gnu/7.3.0/include; \
			ln -sfv ../lib/ld-linux-x86-64.so.2 /lib64; \
			ln -sfv ../lib/ld-linux-x86-64.so.2 /lib64/ld-lsb-x86-64.so.3; \
			;; \
	esac

	cd $(GLIBC_2_27_DIR); \
	rm -f /usr/include/limits.h; \
	mkdir -v build; \
	cd build; \
	CC="gcc -isystem $$GCC_INCDIR -isystem /usr/include"; \
	../configure --prefix=/usr \
		--disable-werror \
		--enable-kernel=3.2 \
		--enable-stack-protector=strong \
		libc_cv_slibdir=/lib; \
	unset GCC_INCDIR
endef

define GLIBC_2_27_BUILD_CMDS
	cd $(GLIBC_2_27_DIR); \
	cd build; \
	make
endef

define GLIBC_2_27_INSTALL_TARGET_CMDS
	cd $(GLIBC_2_27_DIR); \
	cd build; \
	make check; \
	touch /etc/ld.so.conf; \
	sed '/test-installation/s@$(PERL)@echo not running@' -i ../Makefile; \
	make install; \
	cp -v ../nscd/nscd.conf /etc/nscd.conf; \
	mkdir -pv /var/cache/nscd; \
	mkdir -pv /usr/lib/locale; \
	localedef -i cs_CZ -f UTF-8 cs_CZ.UTF-8; \
	localedef -i de_DE -f ISO-8859-1 de_DE; \
	localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro; \
	localedef -i de_DE -f UTF-8 de_DE.UTF-8; \
	localedef -i en_GB -f UTF-8 en_GB.UTF-8; \
	localedef -i en_HK -f ISO-8859-1 en_HK; \
	localedef -i en_PH -f ISO-8859-1 en_PH; \
	localedef -i en_US -f ISO-8859-1 en_US; \
	localedef -i en_US -f UTF-8 en_US.UTF-8; \
	localedef -i es_MX -f ISO-8859-1 es_MX; \
	localedef -i fa_IR -f UTF-8 fa_IR; \
	localedef -i fr_FR -f ISO-8859-1 fr_FR; \
	localedef -i fr_FR@euro -f ISO-8859-15 fr_FR@euro; \
	localedef -i fr_FR -f UTF-8 fr_FR.UTF-8; \
	localedef -i it_IT -f ISO-8859-1 it_IT; \
	localedef -i it_IT -f UTF-8 it_IT.UTF-8; \
	localedef -i ja_JP -f EUC-JP ja_JP; \
	localedef -i ru_RU -f KOI8-R ru_RU.KOI8-R; \
	localedef -i ru_RU -f UTF-8 ru_RU.UTF-8; \
	localedef -i tr_TR -f UTF-8 tr_TR.UTF-8; \
	localedef -i zh_CN -f GB18030 zh_CN.GB18030; \
	make localedata/install-locales

	# Configuring Glibc
	cd $(GLIBC_2_27_DIR); \
	echo -e '# Begin /etc/nsswitch.conf\npasswd: files\n \
			group: files\nshadow: files\n\nhosts: files dns\n\networks: files\n\n \
			protocols: files\nservices: files\nethers: files\nrpc: files\n\n \
			# End /etc/nsswitch.conf\n'	> /etc/nsswitch.conf

	cd $(GLIBC_2_27_DIR); \
	tar -xf ../../tzdata2018c.tar.gz; \
	ZONEINFO=/usr/share/zoneinfo; \
	mkdir -pv $ZONEINFO/{posix,right}; \
	for tz in etcetera southamerica northamerica europe africa antarctica \
		asia australasia backward pacificnew systemv; do; \
		zic -L /dev/null -d $$ZONEINFO -y "sh yearistype.sh" $${tz}; \
		zic -L /dev/null -d $$ZONEINFO/posix -y "sh yearistype.sh" $${tz}; \
		zic -L leapseconds -d $$ZONEINFO/right -y "sh yearistype.sh" $${tz}; \
	done; \
	cp -v zone.tab zone1970.tab iso3166.tab $$ZONEINFO; \
	zic -d $$ZONEINFO -p America/New_York; \
	unset ZONEINFO

	cd $(GLIBC_2_27_DIR); \
	tzselect; \
	cp -v /usr/share/zoneinfo/<xxx> /etc/localtime; \
	echo -e '# Begin /etc/ld.so.conf\n \
			/usr/local/lib\n/opt/lib' > /etc/ld.so.conf; \
	echo -e '# Add an include directory\n \
			include /etc/ld.so.conf.d/*.conf' > /etc/ld.so.conf; \
	mkdir -pv /etc/ld.so.conf.d	

	# Adjusting the Toolchain
	cd $(GLIBC_2_27_DIR); \
	mv -v /tools/bin/{ld,ld-old}; \
	mv -v /tools/$$(uname -m)-pc-linux-gnu/bin/{ld,ld-old}; \
	mv -v /tools/bin/{ld-new,ld}; \
	ln -sv /tools/bin/ld /tools/$$(uname -m)-pc-linux-gnu/bin/ld; \
	gcc -dumpspecs | sed -e 's@/tools@@g' \
		-e '/\*startfile_prefix_spec:/{n;s@.*@/usr/lib/ @}' \
		-e '/\*cpp:/{n;s@$$@ -isystem /usr/include@}' > \
	`dirname $$(gcc --print-libgcc-file-name)`/specs

	cd $(GLIBC_2_27_DIR); \
	echo 'int main(){}' > dummy.c; \
	cc dummy.c -v -Wl,--verbose &> dummy.log; \
	readelf -l a.out | grep ': /lib'; \
	grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log; \
	grep -B1 '^ /usr/include' dummy.log; \
	grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'; \
	grep "/lib.*/libc.so.6 " dummy.log; \
	grep found dummy.log; \
	rm -v dummy.c a.out dummy.log;
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))