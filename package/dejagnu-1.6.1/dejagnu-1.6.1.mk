DEJAGNU_1_6_1_URL=http://ftp.gnu.org/gnu/dejagnu/dejagnu-1.6.1.tar.gz
DEJAGNU_1_6_1_SOURCE=$(LFS-SRC)/dejagnu-1.6.1.tar.gz

define DEJAGNU_1_6_1_SOURCE_CMDS  
	@echo "DEJAGNU_1_6_1_TARGET_SOURCE"
endef

define DEJAGNU_1_6_1_CONFIGURE_CMDS
	cd $(DEJAGNU_1_6_1_DIR); ./configure --prefix=/tools
endef

define DEJAGNU_1_6_1_BUILD_CMDS
	@echo "DEJAGNU_1_6_1_BUILD_CMDS"
endef

define DEJAGNU_1_6_1_INSTALL_TARGET_CMDS
	cd $(DEJAGNU_1_6_1_DIR); \
	make install; \
	[[ -z "$$LFSCHECK" ]] || make check;
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))