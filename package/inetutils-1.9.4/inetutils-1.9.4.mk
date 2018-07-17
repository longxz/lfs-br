INETUTILS_1_9_4_URL=http://ftp.gnu.org/gnu/inetutils/inetutils-1.9.4.tar.xz
INETUTILS_1_9_4_SOURCE=$(LFS-SRC)/inetutils-1.9.4.tar.xz

define INETUTILS_1_9_4_SOURCE_CMDS  
	@echo "INETUTILS_1_9_4_TARGET_SOURCE"
endef

define INETUTILS_1_9_4_CONFIGURE_CMDS
	cd $(INETUTILS_1_9_4_DIR); ./configure --prefix=/tools
endef

define INETUTILS_1_9_4_BUILD_CMDS
	make -C $(INETUTILS_1_9_4_DIR)
endef

define INETUTILS_1_9_4_INSTALL_TARGET_CMDS
	cd $(INETUTILS_1_9_4_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))