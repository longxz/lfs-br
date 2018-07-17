SYSTEMD_MAN_PAGES_237_URL=http://anduin.linuxfromscratch.org/LFS/systemd-man-pages-237.tar.xz
SYSTEMD_MAN_PAGES_237_SOURCE=$(LFS-SRC)/systemd-man-pages-237.tar.xz

define SYSTEMD_MAN_PAGES_237_SOURCE_CMDS  
	@echo "SYSTEMD_MAN_PAGES_237_TARGET_SOURCE"
endef

define SYSTEMD_MAN_PAGES_237_CONFIGURE_CMDS
	cd $(SYSTEMD_MAN_PAGES_237_DIR); ./configure --prefix=/tools
endef

define SYSTEMD_MAN_PAGES_237_BUILD_CMDS
	make -C $(SYSTEMD_MAN_PAGES_237_DIR)
endef

define SYSTEMD_MAN_PAGES_237_INSTALL_TARGET_CMDS
	cd $(SYSTEMD_MAN_PAGES_237_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))