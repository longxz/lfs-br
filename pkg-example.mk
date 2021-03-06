PACKAGE-UP-MAGIC_URL=URL-MAGIC
PACKAGE-UP-MAGIC_SOURCE=$(LFS-SRC)/PACKAGE-MAGIC

define PACKAGE-UP-MAGIC_SOURCE_CMDS  
	@echo "PACKAGE-UP-MAGIC_TARGET_SOURCE"
endef

define PACKAGE-UP-MAGIC_CONFIGURE_CMDS
	cd $(PACKAGE-UP-MAGIC_DIR); ./configure --prefix=/tools
endef

define PACKAGE-UP-MAGIC_BUILD_CMDS
	make -C $(PACKAGE-UP-MAGIC_DIR)
endef

define PACKAGE-UP-MAGIC_INSTALL_TARGET_CMDS
	cd $(PACKAGE-UP-MAGIC_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))