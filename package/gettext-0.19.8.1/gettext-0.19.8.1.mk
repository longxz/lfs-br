GETTEXT_0_19_8_1_URL=http://ftp.gnu.org/gnu/gettext/gettext-0.19.8.1.tar.xz
GETTEXT_0_19_8_1_SOURCE=$(LFS-SRC)/gettext-0.19.8.1.tar.xz

define GETTEXT_0_19_8_1_SOURCE_CMDS  
	@echo "GETTEXT_0_19_8_1_TARGET_SOURCE"
endef

define GETTEXT_0_19_8_1_CONFIGURE_CMDS
	cd $(GETTEXT_0_19_8_1_DIR); \
	cd gettext-tools; \
	EMACS="no" ./configure --prefix=/tools --disable-shared./configure --prefix=/tools
endef

define GETTEXT_0_19_8_1_BUILD_CMDS
	cd $(GETTEXT_0_19_8_1_DIR); \
	make -C gnulib-lib; \
	make -C intl pluralx.c; \
	make -C src msgfmt; \
	make -C src msgmerge; \
	make -C src xgettext
endef

define GETTEXT_0_19_8_1_INSTALL_TARGET_CMDS
	cd $(GETTEXT_0_19_8_1_DIR); \
	cp -v src/{msgfmt,msgmerge,xgettext} /tools/bin
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))