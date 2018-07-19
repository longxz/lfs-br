BZIP2_1_0_6_URL=http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz
BZIP2_1_0_6_SOURCE=$(LFS-SRC)/bzip2-1.0.6.tar.gz

define BZIP2_1_0_6_SOURCE_CMDS  
	@echo "BZIP2_1_0_6_TARGET_SOURCE"
endef

define BZIP2_1_0_6_CONFIGURE_CMDS
	@echo "BZIP2_1_0_6_CONFIGURE_CMDS"
endef

define BZIP2_1_0_6_BUILD_CMDS
	make -C $(BZIP2_1_0_6_DIR)
endef

define BZIP2_1_0_6_INSTALL_TARGET_CMDS
	cd $(BZIP2_1_0_6_DIR); make  PREFIX=/tools install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))