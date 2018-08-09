UTIL_LINUX_2_31_1_URL=https://www.kernel.org/pub/linux/utils/util-linux/v2.31/util-linux-2.31.1.tar.xz
UTIL_LINUX_2_31_1_SOURCE=$(LFS-SRC)/util-linux-2.31.1.tar.xz

define UTIL_LINUX_2_31_1_SOURCE_CMDS  
	@echo "UTIL_LINUX_2_31_1_TARGET_SOURCE"
endef

define UTIL_LINUX_2_31_1_CONFIGURE_CMDS
	cd $(UTIL_LINUX_2_31_1_DIR); \
	./configure --prefix=/tools \
		--without-python \
		--disable-makeinstall-chown \
		--without-systemdsystemunitdir \
		--without-ncurses \
		PKG_CONFIG=""
endef

define UTIL_LINUX_2_31_1_BUILD_CMDS
	make -C $(UTIL_LINUX_2_31_1_DIR)
endef

define UTIL_LINUX_2_31_1_INSTALL_TARGET_CMDS
	cd $(UTIL_LINUX_2_31_1_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))