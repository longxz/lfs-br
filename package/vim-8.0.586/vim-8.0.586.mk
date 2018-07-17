VIM_8_0_586_URL=ftp://ftp.vim.org/pub/vim/unix/vim-8.0.586.tar.bz2
VIM_8_0_586_SOURCE=$(LFS-SRC)/vim-8.0.586.tar.bz2

define VIM_8_0_586_SOURCE_CMDS  
	@echo "VIM_8_0_586_TARGET_SOURCE"
endef

define VIM_8_0_586_CONFIGURE_CMDS
	cd $(VIM_8_0_586_DIR); ./configure --prefix=/tools
endef

define VIM_8_0_586_BUILD_CMDS
	make -C $(VIM_8_0_586_DIR)
endef

define VIM_8_0_586_INSTALL_TARGET_CMDS
	cd $(VIM_8_0_586_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))