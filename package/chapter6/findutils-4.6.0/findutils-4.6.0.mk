FINDUTILS_4_6_0_URL=http://ftp.gnu.org/gnu/findutils/findutils-4.6.0.tar.gz
FINDUTILS_4_6_0_SOURCE=$(LFS-SRC)/findutils-4.6.0.tar.gz

define FINDUTILS_4_6_0_SOURCE_CMDS  
	@echo "FINDUTILS_4_6_0_TARGET_SOURCE"
endef

define FINDUTILS_4_6_0_CONFIGURE_CMDS
	cd $(FINDUTILS_4_6_0_DIR); \
	sed -i 's/test-lock..EXEEXT.//' tests/Makefile.in; \
	./configure --prefix=/usr --localstatedir=/var/lib/locate
endef

define FINDUTILS_4_6_0_BUILD_CMDS
	make -C $(FINDUTILS_4_6_0_DIR)
endef

define FINDUTILS_4_6_0_INSTALL_TARGET_CMDS
	cd $(FINDUTILS_4_6_0_DIR); \
	make check; \
	make install; \
	mv -v /usr/bin/find /bin; \
	sed -i 's|find:=$${BINDIR}|find:=/bin|' /usr/bin/updatedb
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))