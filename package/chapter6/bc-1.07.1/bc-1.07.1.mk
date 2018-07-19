BC_1_07_1_URL=http://ftp.gnu.org/gnu/bc/bc-1.07.1.tar.gz
BC_1_07_1_SOURCE=$(LFS-SRC)/bc-1.07.1.tar.gz

define BC_1_07_1_SOURCE_CMDS  
	@echo "BC_1_07_1_TARGET_SOURCE"
endef

define BC_1_07_1_CONFIGURE_CMDS
	cd $(BC_1_07_1_DIR); ./configure --prefix=/tools
endef

define BC_1_07_1_BUILD_CMDS
	make -C $(BC_1_07_1_DIR)
endef

define BC_1_07_1_INSTALL_TARGET_CMDS
	cd $(BC_1_07_1_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))