GROFF_1_22_3_URL=http://ftp.gnu.org/gnu/groff/groff-1.22.3.tar.gz
GROFF_1_22_3_SOURCE=$(LFS-SRC)/groff-1.22.3.tar.gz

define GROFF_1_22_3_SOURCE_CMDS  
	@echo "GROFF_1_22_3_TARGET_SOURCE"
endef

define GROFF_1_22_3_CONFIGURE_CMDS
	cd $(GROFF_1_22_3_DIR); ./configure --prefix=/tools
endef

define GROFF_1_22_3_BUILD_CMDS
	make -C $(GROFF_1_22_3_DIR)
endef

define GROFF_1_22_3_INSTALL_TARGET_CMDS
	cd $(GROFF_1_22_3_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))