KBD_2_0_4_URL=https://www.kernel.org/pub/linux/utils/kbd/kbd-2.0.4.tar.xz
KBD_2_0_4_SOURCE=$(LFS-SRC)/kbd-2.0.4.tar.xz

define KBD_2_0_4_SOURCE_CMDS  
	@echo "KBD_2_0_4_TARGET_SOURCE"
endef

define KBD_2_0_4_CONFIGURE_CMDS
	cd $(KBD_2_0_4_DIR); ./configure --prefix=/tools
endef

define KBD_2_0_4_BUILD_CMDS
	make -C $(KBD_2_0_4_DIR)
endef

define KBD_2_0_4_INSTALL_TARGET_CMDS
	cd $(KBD_2_0_4_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))