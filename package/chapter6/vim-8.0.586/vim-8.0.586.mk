VIM_8_0_586_URL=ftp://ftp.vim.org/pub/vim/unix/vim-8.0.586.tar.bz2
VIM_8_0_586_SOURCE=$(LFS-SRC)/vim-8.0.586.tar.bz2

define VIM_8_0_586_SOURCE_CMDS  
	@echo "VIM_8_0_586_TARGET_SOURCE"
endef

define VIM_8_0_586_CONFIGURE_CMDS
	cd $(VIM_8_0_586_DIR); \
	echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h; \
	sed -i '/call/{s/split/xsplit/;s/303/492/}' src/testdir/test_recover.vim; \
	./configure --prefix=/usr
endef

define VIM_8_0_586_BUILD_CMDS
	make -C $(VIM_8_0_586_DIR)
endef

define VIM_8_0_586_INSTALL_TARGET_CMDS
	cd $(VIM_8_0_586_DIR); \
	[[ -z "$$LFSCHECK" ]] || make -j1 test &> vim-test.log; \
	make install; \
	ln -sv vim /usr/bin/vi; \
	for L in /usr/share/man/{,*/}man1/vim.1; do \
		ln -sv vim.1 $$(dirname $$L)/vi.1; \
	done; \
	ln -sv ../vim/vim80/doc /usr/share/doc/vim-8.0.586;

	cp $(CATFILES)/chapter6/etc-vimrc /etc/vimrc

endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))