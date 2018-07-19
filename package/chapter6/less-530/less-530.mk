LESS_530_URL=http://www.greenwoodsoftware.com/less/less-530.tar.gz
LESS_530_SOURCE=$(LFS-SRC)/less-530.tar.gz

define LESS_530_SOURCE_CMDS  
	@echo "LESS_530_TARGET_SOURCE"
endef

define LESS_530_CONFIGURE_CMDS
	cd $(LESS_530_DIR); ./configure --prefix=/tools
endef

define LESS_530_BUILD_CMDS
	make -C $(LESS_530_DIR)
endef

define LESS_530_INSTALL_TARGET_CMDS
	cd $(LESS_530_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))