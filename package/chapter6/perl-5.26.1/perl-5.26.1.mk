PERL_5_26_1_URL=http://www.cpan.org/src/5.0/perl-5.26.1.tar.xz
PERL_5_26_1_SOURCE=$(LFS-SRC)/perl-5.26.1.tar.xz

define PERL_5_26_1_SOURCE_CMDS  
	@echo "PERL_5_26_1_TARGET_SOURCE"
endef

define PERL_5_26_1_CONFIGURE_CMDS
	cd $(PERL_5_26_1_DIR); \
	echo "127.0.0.1 localhost $$(hostname)" > /etc/hosts; \
	export BUILD_ZLIB=False; \
	export BUILD_BZIP2=0; \
	sh Configure -des -Dprefix=/usr \
		-Dvendorprefix=/usr \
		-Dman1dir=/usr/share/man/man1 \
		-Dman3dir=/usr/share/man/man3 \
		-Dpager="/usr/bin/less -isR" \
		-Duseshrplib \
		-Dusethreads
endef

define PERL_5_26_1_BUILD_CMDS
	make -C $(PERL_5_26_1_DIR)
endef

define PERL_5_26_1_INSTALL_TARGET_CMDS
	cd $(PERL_5_26_1_DIR); \
	make -k test; \
	make install; \
	unset BUILD_ZLIB BUILD_BZIP2
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))