FINDUTILS_4_6_0_URL=http://ftp.gnu.org/gnu/findutils/findutils-4.6.0.tar.gz
FINDUTILS_4_6_0_SOURCE=$(LFS-SRC)/findutils-4.6.0.tar.gz

define FINDUTILS_4_6_0_SOURCE_CMDS  
	@echo "FINDUTILS_4_6_0_TARGET_SOURCE"
endef

define FINDUTILS_4_6_0_CONFIGURE_CMDS
	cd $(FINDUTILS_4_6_0_DIR); ./configure --prefix=/tools
endef

define FINDUTILS_4_6_0_BUILD_CMDS
	make -C $(FINDUTILS_4_6_0_DIR)
endef

define FINDUTILS_4_6_0_INSTALL_TARGET_CMDS
	cd $(FINDUTILS_4_6_0_DIR); \
	make check; \
	make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))