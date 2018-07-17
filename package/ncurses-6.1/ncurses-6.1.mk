NCURSES_6_1_URL=http://ftp.gnu.org/gnu//ncurses/ncurses-6.1.tar.gz
NCURSES_6_1_SOURCE=$(LFS-SRC)/ncurses-6.1.tar.gz

define NCURSES_6_1_SOURCE_CMDS  
	@echo "NCURSES_6_1_TARGET_SOURCE"
endef

define NCURSES_6_1_CONFIGURE_CMDS
	cd $(NCURSES_6_1_DIR); ./configure --prefix=/tools
endef

define NCURSES_6_1_BUILD_CMDS
	make -C $(NCURSES_6_1_DIR)
endef

define NCURSES_6_1_INSTALL_TARGET_CMDS
	cd $(NCURSES_6_1_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))