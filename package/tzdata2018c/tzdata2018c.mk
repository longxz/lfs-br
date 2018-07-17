TZDATA2018C_URL=http://www.iana.org/time-zones/repository/releases/tzdata2018c.tar.gz
TZDATA2018C_SOURCE=$(LFS-SRC)/tzdata2018c.tar.gz

define TZDATA2018C_SOURCE_CMDS  
	@echo "TZDATA2018C_TARGET_SOURCE"
endef

define TZDATA2018C_CONFIGURE_CMDS
	cd $(TZDATA2018C_DIR); ./configure --prefix=/tools
endef

define TZDATA2018C_BUILD_CMDS
	make -C $(TZDATA2018C_DIR)
endef

define TZDATA2018C_INSTALL_TARGET_CMDS
	cd $(TZDATA2018C_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))