SED_4_4_URL=http://ftp.gnu.org/gnu/sed/sed-4.4.tar.xz
SED_4_4_SOURCE=$(LFS-SRC)/sed-4.4.tar.xz

define SED_4_4_SOURCE_CMDS  
	@echo "SED_4_4_TARGET_SOURCE"
endef

define SED_4_4_CONFIGURE_CMDS
	cd $(SED_4_4_DIR); \
	sed -i 's/usr/tools/' build-aux/help2man; \
	sed -i 's/testsuite.panic-tests.sh//' Makefile.in; \
	./configure --prefix=/usr --bindir=/bin
endef

define SED_4_4_BUILD_CMDS
	cd $(SED_4_4_DIR); \
	make; \
	make html
endef

define SED_4_4_INSTALL_TARGET_CMDS
	cd $(SED_4_4_DIR); \
	[[ -z "$$LFSCHECK" ]] || make check; \
	make install; \
	install -d -m755 /usr/share/doc/sed-4.4; \
	install -m644 doc/sed.html /usr/share/doc/sed-4.4
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))