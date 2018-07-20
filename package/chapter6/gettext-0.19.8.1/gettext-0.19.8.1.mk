GETTEXT_0_19_8_1_URL=http://ftp.gnu.org/gnu/gettext/gettext-0.19.8.1.tar.xz
GETTEXT_0_19_8_1_SOURCE=$(LFS-SRC)/gettext-0.19.8.1.tar.xz

define GETTEXT_0_19_8_1_SOURCE_CMDS  
	@echo "GETTEXT_0_19_8_1_TARGET_SOURCE"
endef

define GETTEXT_0_19_8_1_CONFIGURE_CMDS
	cd $(GETTEXT_0_19_8_1_DIR); \
	sed -i '/^TESTS =/d' gettext-runtime/tests/Makefile.in && sed -i 's/test-lock..EXEEXT.//' \
	./configure --prefix=/usr \
	--disable-static \
	--docdir=/usr/share/doc/gettext-0.19.8.1
endef

define GETTEXT_0_19_8_1_BUILD_CMDS
	cd $(GETTEXT_0_19_8_1_DIR); \
	make
endef

define GETTEXT_0_19_8_1_INSTALL_TARGET_CMDS
	cd $(GETTEXT_0_19_8_1_DIR); \
	make check; \
	make install; \
	chmod -v 0755 /usr/lib/preloadable_libintl.so
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))