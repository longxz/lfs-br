EXPECT5_45_4_URL=http://prdownloads.sourceforge.net/expect/expect5.45.4.tar.gz
EXPECT5_45_4_SOURCE=$(LFS-SRC)/expect5.45.4.tar.gz

define EXPECT5_45_4_SOURCE_CMDS  
	@echo "EXPECT5_45_4_TARGET_SOURCE"
endef

define EXPECT5_45_4_CONFIGURE_CMDS
	cd $(EXPECT5_45_4_DIR); ./configure --prefix=/tools
endef

define EXPECT5_45_4_BUILD_CMDS
	make -C $(EXPECT5_45_4_DIR)
endef

define EXPECT5_45_4_INSTALL_TARGET_CMDS
	cd $(EXPECT5_45_4_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))