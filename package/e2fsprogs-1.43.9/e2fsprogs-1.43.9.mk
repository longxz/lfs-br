E2FSPROGS_1_43_9_URL=http://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v1.43.9/e2fsprogs-1.43.9.tar.gz
E2FSPROGS_1_43_9_SOURCE=$(LFS-SRC)/e2fsprogs-1.43.9.tar.gz

define E2FSPROGS_1_43_9_SOURCE_CMDS  
	@echo "E2FSPROGS_1_43_9_TARGET_SOURCE"
endef

define E2FSPROGS_1_43_9_CONFIGURE_CMDS
	cd $(E2FSPROGS_1_43_9_DIR); ./configure --prefix=/tools
endef

define E2FSPROGS_1_43_9_BUILD_CMDS
	make -C $(E2FSPROGS_1_43_9_DIR)
endef

define E2FSPROGS_1_43_9_INSTALL_TARGET_CMDS
	cd $(E2FSPROGS_1_43_9_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))