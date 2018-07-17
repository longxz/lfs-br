SYSTEMD_237_URL=https://github.com/systemd/systemd/archive/v237/systemd-237.tar.gz
SYSTEMD_237_SOURCE=$(LFS-SRC)/systemd-237.tar.gz

define SYSTEMD_237_SOURCE_CMDS  
	@echo "SYSTEMD_237_TARGET_SOURCE"
endef

define SYSTEMD_237_CONFIGURE_CMDS
	cd $(SYSTEMD_237_DIR); ./configure --prefix=/tools
endef

define SYSTEMD_237_BUILD_CMDS
	make -C $(SYSTEMD_237_DIR)
endef

define SYSTEMD_237_INSTALL_TARGET_CMDS
	cd $(SYSTEMD_237_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))