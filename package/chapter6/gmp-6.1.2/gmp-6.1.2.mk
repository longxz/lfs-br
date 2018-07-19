GMP_6_1_2_URL=http://ftp.gnu.org/gnu/gmp/gmp-6.1.2.tar.xz
GMP_6_1_2_SOURCE=$(LFS-SRC)/gmp-6.1.2.tar.xz

define GMP_6_1_2_SOURCE_CMDS  
	@echo "GMP_6_1_2_TARGET_SOURCE"
endef

define GMP_6_1_2_CONFIGURE_CMDS
	cd $(GMP_6_1_2_DIR); ./configure --prefix=/tools
endef

define GMP_6_1_2_BUILD_CMDS
	make -C $(GMP_6_1_2_DIR)
endef

define GMP_6_1_2_INSTALL_TARGET_CMDS
	cd $(GMP_6_1_2_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))