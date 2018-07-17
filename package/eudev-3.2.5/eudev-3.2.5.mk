EUDEV_3_2_5_URL=http://dev.gentoo.org/~blueness/eudev/eudev-3.2.5.tar.gz
EUDEV_3_2_5_SOURCE=$(LFS-SRC)/eudev-3.2.5.tar.gz

define EUDEV_3_2_5_SOURCE_CMDS  
	@echo "EUDEV_3_2_5_TARGET_SOURCE"
endef

define EUDEV_3_2_5_CONFIGURE_CMDS
	cd $(EUDEV_3_2_5_DIR); ./configure --prefix=/tools
endef

define EUDEV_3_2_5_BUILD_CMDS
	make -C $(EUDEV_3_2_5_DIR)
endef

define EUDEV_3_2_5_INSTALL_TARGET_CMDS
	cd $(EUDEV_3_2_5_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))