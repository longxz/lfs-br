INTLTOOL_0_51_0_URL=http://launchpad.net/intltool/trunk/0.51.0/+download/intltool-0.51.0.tar.gz
INTLTOOL_0_51_0_SOURCE=$(LFS-SRC)/intltool-0.51.0.tar.gz

define INTLTOOL_0_51_0_SOURCE_CMDS  
	@echo "INTLTOOL_0_51_0_TARGET_SOURCE"
endef

define INTLTOOL_0_51_0_CONFIGURE_CMDS
	cd $(INTLTOOL_0_51_0_DIR); ./configure --prefix=/tools
endef

define INTLTOOL_0_51_0_BUILD_CMDS
	make -C $(INTLTOOL_0_51_0_DIR)
endef

define INTLTOOL_0_51_0_INSTALL_TARGET_CMDS
	cd $(INTLTOOL_0_51_0_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))