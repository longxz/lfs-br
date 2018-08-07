AUTOCONF_2_69_URL=http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz
AUTOCONF_2_69_SOURCE=$(LFS-SRC)/autoconf-2.69.tar.xz

define AUTOCONF_2_69_SOURCE_CMDS  
	@echo "AUTOCONF_2_69_TARGET_SOURCE"
endef

define AUTOCONF_2_69_CONFIGURE_CMDS
	cd $(AUTOCONF_2_69_DIR); ./configure --prefix=/usr
endef

define AUTOCONF_2_69_BUILD_CMDS
	make -C $(AUTOCONF_2_69_DIR)
endef

define AUTOCONF_2_69_INSTALL_TARGET_CMDS
	cd $(AUTOCONF_2_69_DIR); \
	[[ -z "$$LFSCHECK" ]] || make check; \
	make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))