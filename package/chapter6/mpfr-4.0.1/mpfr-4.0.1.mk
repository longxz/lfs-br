MPFR_4_0_1_URL=http://www.mpfr.org/mpfr-4.0.1/mpfr-4.0.1.tar.xz
MPFR_4_0_1_SOURCE=$(LFS-SRC)/mpfr-4.0.1.tar.xz

define MPFR_4_0_1_SOURCE_CMDS  
	@echo "MPFR_4_0_1_TARGET_SOURCE"
endef

define MPFR_4_0_1_CONFIGURE_CMDS
	cd $(MPFR_4_0_1_DIR); ./configure --prefix=/tools
endef

define MPFR_4_0_1_BUILD_CMDS
	make -C $(MPFR_4_0_1_DIR)
endef

define MPFR_4_0_1_INSTALL_TARGET_CMDS
	cd $(MPFR_4_0_1_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))