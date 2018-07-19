SYSVINIT_2_88DSF_URL=https://download.savannah.gnu.org/releases/sysvinit/sysvinit-2.88dsf.tar.bz2
SYSVINIT_2_88DSF_SOURCE=$(LFS-SRC)/sysvinit-2.88dsf.tar.bz2

define SYSVINIT_2_88DSF_SOURCE_CMDS  
	@echo "SYSVINIT_2_88DSF_TARGET_SOURCE"
endef

define SYSVINIT_2_88DSF_CONFIGURE_CMDS
	cd $(SYSVINIT_2_88DSF_DIR); ./configure --prefix=/tools
endef

define SYSVINIT_2_88DSF_BUILD_CMDS
	make -C $(SYSVINIT_2_88DSF_DIR)
endef

define SYSVINIT_2_88DSF_INSTALL_TARGET_CMDS
	cd $(SYSVINIT_2_88DSF_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))