ATTR_2_4_47_SRC_URL=https://download.savannah.gnu.org/releases/attr/attr-2.4.47.src.tar.gz
ATTR_2_4_47_SRC_SOURCE=$(LFS-SRC)/attr-2.4.47.src.tar.gz

define ATTR_2_4_47_SRC_SOURCE_CMDS  
	@echo "ATTR_2_4_47_SRC_TARGET_SOURCE"
endef

define ATTR_2_4_47_SRC_CONFIGURE_CMDS
	cd $(ATTR_2_4_47_SRC_DIR); ./configure --prefix=/tools
endef

define ATTR_2_4_47_SRC_BUILD_CMDS
	make -C $(ATTR_2_4_47_SRC_DIR)
endef

define ATTR_2_4_47_SRC_INSTALL_TARGET_CMDS
	cd $(ATTR_2_4_47_SRC_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))