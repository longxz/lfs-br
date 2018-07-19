SED_4_4_URL=http://ftp.gnu.org/gnu/sed/sed-4.4.tar.xz
SED_4_4_SOURCE=$(LFS-SRC)/sed-4.4.tar.xz

define SED_4_4_SOURCE_CMDS  
	@echo "SED_4_4_TARGET_SOURCE"
endef

define SED_4_4_CONFIGURE_CMDS
	cd $(SED_4_4_DIR); ./configure --prefix=/tools
endef

define SED_4_4_BUILD_CMDS
	make -C $(SED_4_4_DIR)
endef

define SED_4_4_INSTALL_TARGET_CMDS
	cd $(SED_4_4_DIR); \
	make check; \
	make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))