MAN_PAGES_4_15_URL=https://www.kernel.org/pub/linux/docs/man-pages/man-pages-4.15.tar.xz
MAN_PAGES_4_15_SOURCE=$(LFS-SRC)/man-pages-4.15.tar.xz

define MAN_PAGES_4_15_SOURCE_CMDS  
	@echo "MAN_PAGES_4_15_TARGET_SOURCE"
endef

define MAN_PAGES_4_15_CONFIGURE_CMDS
	@echo "MAN_PAGES_4_15_CONFIGURE_CMDS"
endef

define MAN_PAGES_4_15_BUILD_CMDS
	@echo "MAN_PAGES_4_15_BUILD_CMDS"
endef

define MAN_PAGES_4_15_INSTALL_TARGET_CMDS
	cd $(MAN_PAGES_4_15_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))