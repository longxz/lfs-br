SYSVINIT_2_88DSF_URL=https://download.savannah.gnu.org/releases/sysvinit/sysvinit-2.88dsf.tar.bz2
SYSVINIT_2_88DSF_SOURCE=$(LFS-SRC)/sysvinit-2.88dsf.tar.bz2

define SYSVINIT_2_88DSF_SOURCE_CMDS  
	@echo "SYSVINIT_2_88DSF_TARGET_SOURCE"
endef

define SYSVINIT_2_88DSF_CONFIGURE_CMDS
	cd $(SYSVINIT_2_88DSF_DIR); \
	patch -Np1 -i ../sysvinit-2.88dsf-consolidated-1.patch 
endef

define SYSVINIT_2_88DSF_BUILD_CMDS
	cd $(SYSVINIT_2_88DSF_DIR); \
	make -C src
endef

define SYSVINIT_2_88DSF_INSTALL_TARGET_CMDS
	cd $(SYSVINIT_2_88DSF_DIR); \
	make -C src install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))