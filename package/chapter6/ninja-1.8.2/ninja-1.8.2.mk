NINJA_1_8_2_URL=https://github.com/ninja-build/ninja/archive/v1.8.2/ninja-1.8.2.tar.gz
NINJA_1_8_2_SOURCE=$(LFS-SRC)/ninja-1.8.2.tar.gz

define NINJA_1_8_2_SOURCE_CMDS  
	@echo "NINJA_1_8_2_TARGET_SOURCE"
endef

define NINJA_1_8_2_CONFIGURE_CMDS
	cd $(NINJA_1_8_2_DIR); ./configure --prefix=/tools
endef

define NINJA_1_8_2_BUILD_CMDS
	make -C $(NINJA_1_8_2_DIR)
endef

define NINJA_1_8_2_INSTALL_TARGET_CMDS
	cd $(NINJA_1_8_2_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))