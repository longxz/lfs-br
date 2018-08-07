PKG_CONFIG_0_29_2_URL=https://pkg-config.freedesktop.org/releases/pkg-config-0.29.2.tar.gz
PKG_CONFIG_0_29_2_SOURCE=$(LFS-SRC)/pkg-config-0.29.2.tar.gz

define PKG_CONFIG_0_29_2_SOURCE_CMDS  
	@echo "PKG_CONFIG_0_29_2_TARGET_SOURCE"
endef

define PKG_CONFIG_0_29_2_CONFIGURE_CMDS
	cd $(PKG_CONFIG_0_29_2_DIR); \
	./configure --prefix=/usr \
		--with-internal-glib \
		--disable-host-tool \
		--docdir=/usr/share/doc/pkg-config-0.29.2
endef

define PKG_CONFIG_0_29_2_BUILD_CMDS
	make -C $(PKG_CONFIG_0_29_2_DIR)
endef

define PKG_CONFIG_0_29_2_INSTALL_TARGET_CMDS
	cd $(PKG_CONFIG_0_29_2_DIR); \
	[[ -z "$$LFSCHECK" ]] || make check; \
	make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))