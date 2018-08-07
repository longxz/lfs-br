PATCH_2_7_6_URL=http://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz
PATCH_2_7_6_SOURCE=$(LFS-SRC)/patch-2.7.6.tar.xz

define PATCH_2_7_6_SOURCE_CMDS  
	@echo "PATCH_2_7_6_TARGET_SOURCE"
endef

define PATCH_2_7_6_CONFIGURE_CMDS
	cd $(PATCH_2_7_6_DIR); ./configure --prefix=/usr
endef

define PATCH_2_7_6_BUILD_CMDS
	make -C $(PATCH_2_7_6_DIR)
endef

define PATCH_2_7_6_INSTALL_TARGET_CMDS
	cd $(PATCH_2_7_6_DIR); \
	[[ -z "$$LFSCHECK" ]] || make check; \
	make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))