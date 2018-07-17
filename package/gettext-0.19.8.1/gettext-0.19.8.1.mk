GETTEXT_0_19_8_1_URL=http://ftp.gnu.org/gnu/gettext/gettext-0.19.8.1.tar.xz
GETTEXT_0_19_8_1_SOURCE=$(LFS-SRC)/gettext-0.19.8.1.tar.xz

define GETTEXT_0_19_8_1_SOURCE_CMDS  
	@echo "GETTEXT_0_19_8_1_TARGET_SOURCE"
endef

define GETTEXT_0_19_8_1_CONFIGURE_CMDS
	cd $(GETTEXT_0_19_8_1_DIR); ./configure --prefix=/tools
endef

define GETTEXT_0_19_8_1_BUILD_CMDS
	make -C $(GETTEXT_0_19_8_1_DIR)
endef

define GETTEXT_0_19_8_1_INSTALL_TARGET_CMDS
	cd $(GETTEXT_0_19_8_1_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))