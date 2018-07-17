FLEX_2_6_4_URL=https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz
FLEX_2_6_4_SOURCE=$(LFS-SRC)/flex-2.6.4.tar.gz

define FLEX_2_6_4_SOURCE_CMDS  
	@echo "FLEX_2_6_4_TARGET_SOURCE"
endef

define FLEX_2_6_4_CONFIGURE_CMDS
	cd $(FLEX_2_6_4_DIR); ./configure --prefix=/tools
endef

define FLEX_2_6_4_BUILD_CMDS
	make -C $(FLEX_2_6_4_DIR)
endef

define FLEX_2_6_4_INSTALL_TARGET_CMDS
	cd $(FLEX_2_6_4_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))