AUTOMAKE_1_15_1_URL=http://ftp.gnu.org/gnu/automake/automake-1.15.1.tar.xz
AUTOMAKE_1_15_1_SOURCE=$(LFS-SRC)/automake-1.15.1.tar.xz

define AUTOMAKE_1_15_1_SOURCE_CMDS  
	@echo "AUTOMAKE_1_15_1_TARGET_SOURCE"
endef

define AUTOMAKE_1_15_1_CONFIGURE_CMDS
	cd $(AUTOMAKE_1_15_1_DIR); ./configure --prefix=/tools
endef

define AUTOMAKE_1_15_1_BUILD_CMDS
	make -C $(AUTOMAKE_1_15_1_DIR)
endef

define AUTOMAKE_1_15_1_INSTALL_TARGET_CMDS
	cd $(AUTOMAKE_1_15_1_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))