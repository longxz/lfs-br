CHECK_0_12_0_URL=https://github.com/libcheck/check/releases/download/0.12.0/check-0.12.0.tar.gz
CHECK_0_12_0_SOURCE=$(LFS-SRC)/check-0.12.0.tar.gz

define CHECK_0_12_0_SOURCE_CMDS  
	@echo "CHECK_0_12_0_TARGET_SOURCE"
endef

define CHECK_0_12_0_CONFIGURE_CMDS
	cd $(CHECK_0_12_0_DIR); ./configure --prefix=/usr
endef

define CHECK_0_12_0_BUILD_CMDS
	make -C $(CHECK_0_12_0_DIR)
endef

define CHECK_0_12_0_INSTALL_TARGET_CMDS
	cd $(CHECK_0_12_0_DIR); \
	[[ -z "$$LFSCHECK" ]] || make check; \
	make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))