IPROUTE2_4_15_0_URL=https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-4.15.0.tar.xz
IPROUTE2_4_15_0_SOURCE=$(LFS-SRC)/iproute2-4.15.0.tar.xz

define IPROUTE2_4_15_0_SOURCE_CMDS  
	@echo "IPROUTE2_4_15_0_TARGET_SOURCE"
endef

define IPROUTE2_4_15_0_CONFIGURE_CMDS
	cd $(IPROUTE2_4_15_0_DIR); ./configure --prefix=/tools
endef

define IPROUTE2_4_15_0_BUILD_CMDS
	make -C $(IPROUTE2_4_15_0_DIR)
endef

define IPROUTE2_4_15_0_INSTALL_TARGET_CMDS
	cd $(IPROUTE2_4_15_0_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))