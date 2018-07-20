LINUX_4_15_3_URL=https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.15.3.tar.xz
LINUX_4_15_3_SOURCE=$(LFS-SRC)/linux-4.15.3.tar.xz

define LINUX_4_15_3_SOURCE_CMDS  
	@echo "LINUX_4_15_3_TARGET_SOURCE"
endef

define LINUX_4_15_3_CONFIGURE_CMDS
	@echo "LINUX_4_15_3_CONFIGURE_CMDS"
endef

define LINUX_4_15_3_BUILD_CMDS
	@echo "LINUX_4_15_3_BUILD_CMDS"
endef

define LINUX_4_15_3_INSTALL_TARGET_CMDS
	cd $(LINUX_4_15_3_DIR); \
	make mrproper; \
	make INSTALL_HDR_PATH=dest headers_install; \
	find dest/include \( -name .install -o -name ..install.cmd \) -delete; \
	cp -rv dest/include/* /usr/include
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))