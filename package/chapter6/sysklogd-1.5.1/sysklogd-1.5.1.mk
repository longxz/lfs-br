SYSKLOGD_1_5_1_URL=http://www.infodrom.org/projects/sysklogd/download/sysklogd-1.5.1.tar.gz
SYSKLOGD_1_5_1_SOURCE=$(LFS-SRC)/sysklogd-1.5.1.tar.gz

define SYSKLOGD_1_5_1_SOURCE_CMDS  
	@echo "SYSKLOGD_1_5_1_TARGET_SOURCE"
endef

define SYSKLOGD_1_5_1_CONFIGURE_CMDS
	cd $(SYSKLOGD_1_5_1_DIR); ./configure --prefix=/tools
endef

define SYSKLOGD_1_5_1_BUILD_CMDS
	make -C $(SYSKLOGD_1_5_1_DIR)
endef

define SYSKLOGD_1_5_1_INSTALL_TARGET_CMDS
	cd $(SYSKLOGD_1_5_1_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))