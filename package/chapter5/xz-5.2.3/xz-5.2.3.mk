XZ_5_2_3_URL=http://tukaani.org/xz/xz-5.2.3.tar.xz
XZ_5_2_3_SOURCE=$(LFS-SRC)/xz-5.2.3.tar.xz

define XZ_5_2_3_SOURCE_CMDS  
	@echo "XZ_5_2_3_TARGET_SOURCE"
endef

define XZ_5_2_3_CONFIGURE_CMDS
	cd $(XZ_5_2_3_DIR); ./configure --prefix=/tools
endef

define XZ_5_2_3_BUILD_CMDS
	make -C $(XZ_5_2_3_DIR)
endef

define XZ_5_2_3_INSTALL_TARGET_CMDS
	cd $(XZ_5_2_3_DIR); \
	[[ -z "$$LFSCHECK" ]] || make check; \
	make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))