LIBPIPELINE_1_5_0_URL=https://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.5.0.tar.gz
LIBPIPELINE_1_5_0_SOURCE=$(LFS-SRC)/libpipeline-1.5.0.tar.gz

define LIBPIPELINE_1_5_0_SOURCE_CMDS  
	@echo "LIBPIPELINE_1_5_0_TARGET_SOURCE"
endef

define LIBPIPELINE_1_5_0_CONFIGURE_CMDS
	cd $(LIBPIPELINE_1_5_0_DIR); ./configure --prefix=/tools
endef

define LIBPIPELINE_1_5_0_BUILD_CMDS
	make -C $(LIBPIPELINE_1_5_0_DIR)
endef

define LIBPIPELINE_1_5_0_INSTALL_TARGET_CMDS
	cd $(LIBPIPELINE_1_5_0_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))