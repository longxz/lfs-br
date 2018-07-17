GREP_3_1_URL=http://ftp.gnu.org/gnu/grep/grep-3.1.tar.xz
GREP_3_1_SOURCE=$(LFS-SRC)/grep-3.1.tar.xz

define GREP_3_1_SOURCE_CMDS  
	@echo "GREP_3_1_TARGET_SOURCE"
endef

define GREP_3_1_CONFIGURE_CMDS
	cd $(GREP_3_1_DIR); ./configure --prefix=/tools
endef

define GREP_3_1_BUILD_CMDS
	make -C $(GREP_3_1_DIR)
endef

define GREP_3_1_INSTALL_TARGET_CMDS
	cd $(GREP_3_1_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))