BC_1_07_1_URL=http://ftp.gnu.org/gnu/bc/bc-1.07.1.tar.gz
BC_1_07_1_SOURCE=$(LFS-SRC)/bc-1.07.1.tar.gz

define BC_1_07_1_SOURCE_CMDS  
	@echo "BC_1_07_1_TARGET_SOURCE"
endef

define BC_1_07_1_CONFIGURE_CMDS
	cp $(CATFILES)/chapter6/bc-fix-libmath_h $(BC_1_07_1_DIR)/bc/fix-libmath_h

	cd $(BC_1_07_1_DIR); \
	ln -sv /tools/lib/libncursesw.so.6 /usr/lib/libncursesw.so.6; \
	ln -sfv libncurses.so.6 /usr/lib/libncurses.so; \
	sed -i -e '/flex/s/as_fn_error/: ;; # &/' configure; \

	cd $(BC_1_07_1_DIR); \
	./configure --prefix=/usr \
		--with-readline \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info
endef

define BC_1_07_1_BUILD_CMDS
	cd $(BC_1_07_1_DIR); \
	make; \
	[[ -z "$$LFSCHECK" ]] || echo "quit" | ./bc/bc -l Test/checklib.b
endef

define BC_1_07_1_INSTALL_TARGET_CMDS
	cd $(BC_1_07_1_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))