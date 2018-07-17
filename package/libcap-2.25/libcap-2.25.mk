LIBCAP_2_25_URL=https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.25.tar.xz
LIBCAP_2_25_SOURCE=$(LFS-SRC)/libcap-2.25.tar.xz

define LIBCAP_2_25_SOURCE_CMDS  
	@echo "LIBCAP_2_25_TARGET_SOURCE"
endef

define LIBCAP_2_25_CONFIGURE_CMDS
	cd $(LIBCAP_2_25_DIR); ./configure --prefix=/tools
endef

define LIBCAP_2_25_BUILD_CMDS
	make -C $(LIBCAP_2_25_DIR)
endef

define LIBCAP_2_25_INSTALL_TARGET_CMDS
	cd $(LIBCAP_2_25_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))