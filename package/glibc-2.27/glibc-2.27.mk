GLIBC_2_27_URL=http://ftp.gnu.org/gnu/glibc/glibc-2.27.tar.xz
GLIBC_2_27_SOURCE=$(LFS-SRC)/glibc-2.27.tar.xz

define GLIBC_2_27_SOURCE_CMDS  
	@echo "GLIBC_2_27_TARGET_SOURCE"
endef

define GLIBC_2_27_CONFIGURE_CMDS
	cd $(GLIBC_2_27_DIR); ./configure --prefix=/tools
endef

define GLIBC_2_27_BUILD_CMDS
	make -C $(GLIBC_2_27_DIR)
endef

define GLIBC_2_27_INSTALL_TARGET_CMDS
	cd $(GLIBC_2_27_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))