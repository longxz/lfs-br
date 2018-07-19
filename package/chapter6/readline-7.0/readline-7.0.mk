READLINE_7_0_URL=http://ftp.gnu.org/gnu/readline/readline-7.0.tar.gz
READLINE_7_0_SOURCE=$(LFS-SRC)/readline-7.0.tar.gz

define READLINE_7_0_SOURCE_CMDS  
	@echo "READLINE_7_0_TARGET_SOURCE"
endef

define READLINE_7_0_CONFIGURE_CMDS
	cd $(READLINE_7_0_DIR); ./configure --prefix=/tools
endef

define READLINE_7_0_BUILD_CMDS
	make -C $(READLINE_7_0_DIR)
endef

define READLINE_7_0_INSTALL_TARGET_CMDS
	cd $(READLINE_7_0_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))