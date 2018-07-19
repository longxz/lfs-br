SHADOW_4_5_URL=https://github.com/shadow-maint/shadow/releases/download/4.5/shadow-4.5.tar.xz
SHADOW_4_5_SOURCE=$(LFS-SRC)/shadow-4.5.tar.xz

define SHADOW_4_5_SOURCE_CMDS  
	@echo "SHADOW_4_5_TARGET_SOURCE"
endef

define SHADOW_4_5_CONFIGURE_CMDS
	cd $(SHADOW_4_5_DIR); ./configure --prefix=/tools
endef

define SHADOW_4_5_BUILD_CMDS
	make -C $(SHADOW_4_5_DIR)
endef

define SHADOW_4_5_INSTALL_TARGET_CMDS
	cd $(SHADOW_4_5_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))