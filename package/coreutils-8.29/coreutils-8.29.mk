COREUTILS_8_29_URL=http://ftp.gnu.org/gnu/coreutils/coreutils-8.29.tar.xz
COREUTILS_8_29_SOURCE=$(LFS-SRC)/coreutils-8.29.tar.xz

define COREUTILS_8_29_SOURCE_CMDS  
	@echo "COREUTILS_8_29_TARGET_SOURCE"
endef

define COREUTILS_8_29_CONFIGURE_CMDS
	cd $(COREUTILS_8_29_DIR); ./configure --prefix=/tools
endef

define COREUTILS_8_29_BUILD_CMDS
	make -C $(COREUTILS_8_29_DIR)
endef

define COREUTILS_8_29_INSTALL_TARGET_CMDS
	cd $(COREUTILS_8_29_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))