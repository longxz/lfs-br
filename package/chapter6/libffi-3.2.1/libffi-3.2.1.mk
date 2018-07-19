LIBFFI_3_2_1_URL=ftp://sourceware.org/pub/libffi/libffi-3.2.1.tar.gz
LIBFFI_3_2_1_SOURCE=$(LFS-SRC)/libffi-3.2.1.tar.gz

define LIBFFI_3_2_1_SOURCE_CMDS  
	@echo "LIBFFI_3_2_1_TARGET_SOURCE"
endef

define LIBFFI_3_2_1_CONFIGURE_CMDS
	cd $(LIBFFI_3_2_1_DIR); ./configure --prefix=/tools
endef

define LIBFFI_3_2_1_BUILD_CMDS
	make -C $(LIBFFI_3_2_1_DIR)
endef

define LIBFFI_3_2_1_INSTALL_TARGET_CMDS
	cd $(LIBFFI_3_2_1_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))