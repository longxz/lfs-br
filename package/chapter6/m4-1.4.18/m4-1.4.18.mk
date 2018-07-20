M4_1_4_18_URL=http://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.xz
M4_1_4_18_SOURCE=$(LFS-SRC)/m4-1.4.18.tar.xz

define M4_1_4_18_SOURCE_CMDS  
	@echo "M4_1_4_18_TARGET_SOURCE"
endef

define M4_1_4_18_CONFIGURE_CMDS
	cd $(M4_1_4_18_DIR); ./configure --prefix=/usr
endef

define M4_1_4_18_BUILD_CMDS
	make -C $(M4_1_4_18_DIR)
endef

define M4_1_4_18_INSTALL_TARGET_CMDS
	cd $(M4_1_4_18_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))