ELFUTILS_0_170_URL=https://sourceware.org/ftp/elfutils/0.170/elfutils-0.170.tar.bz2
ELFUTILS_0_170_SOURCE=$(LFS-SRC)/elfutils-0.170.tar.bz2

define ELFUTILS_0_170_SOURCE_CMDS  
	@echo "ELFUTILS_0_170_TARGET_SOURCE"
endef

define ELFUTILS_0_170_CONFIGURE_CMDS
	cd $(ELFUTILS_0_170_DIR); ./configure --prefix=/tools
endef

define ELFUTILS_0_170_BUILD_CMDS
	make -C $(ELFUTILS_0_170_DIR)
endef

define ELFUTILS_0_170_INSTALL_TARGET_CMDS
	cd $(ELFUTILS_0_170_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))