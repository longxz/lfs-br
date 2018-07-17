DIFFUTILS_3_6_URL=http://ftp.gnu.org/gnu/diffutils/diffutils-3.6.tar.xz
DIFFUTILS_3_6_SOURCE=$(LFS-SRC)/diffutils-3.6.tar.xz

define DIFFUTILS_3_6_SOURCE_CMDS  
	@echo "DIFFUTILS_3_6_TARGET_SOURCE"
endef

define DIFFUTILS_3_6_CONFIGURE_CMDS
	cd $(DIFFUTILS_3_6_DIR); ./configure --prefix=/tools
endef

define DIFFUTILS_3_6_BUILD_CMDS
	make -C $(DIFFUTILS_3_6_DIR)
endef

define DIFFUTILS_3_6_INSTALL_TARGET_CMDS
	cd $(DIFFUTILS_3_6_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))