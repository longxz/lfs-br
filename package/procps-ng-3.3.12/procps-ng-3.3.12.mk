PROCPS_NG_3_3_12_URL=http://sourceforge.net/projects/procps-ng/files/Production/procps-ng-3.3.12.tar.xz
PROCPS_NG_3_3_12_SOURCE=$(LFS-SRC)/procps-ng-3.3.12.tar.xz

define PROCPS_NG_3_3_12_SOURCE_CMDS  
	@echo "PROCPS_NG_3_3_12_TARGET_SOURCE"
endef

define PROCPS_NG_3_3_12_CONFIGURE_CMDS
	cd $(PROCPS_NG_3_3_12_DIR); ./configure --prefix=/tools
endef

define PROCPS_NG_3_3_12_BUILD_CMDS
	make -C $(PROCPS_NG_3_3_12_DIR)
endef

define PROCPS_NG_3_3_12_INSTALL_TARGET_CMDS
	cd $(PROCPS_NG_3_3_12_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))