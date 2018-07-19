EXPAT_2_2_5_URL=http://prdownloads.sourceforge.net/expat/expat-2.2.5.tar.bz2
EXPAT_2_2_5_SOURCE=$(LFS-SRC)/expat-2.2.5.tar.bz2

define EXPAT_2_2_5_SOURCE_CMDS  
	@echo "EXPAT_2_2_5_TARGET_SOURCE"
endef

define EXPAT_2_2_5_CONFIGURE_CMDS
	cd $(EXPAT_2_2_5_DIR); ./configure --prefix=/tools
endef

define EXPAT_2_2_5_BUILD_CMDS
	make -C $(EXPAT_2_2_5_DIR)
endef

define EXPAT_2_2_5_INSTALL_TARGET_CMDS
	cd $(EXPAT_2_2_5_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))