MAKE_4_2_1_URL=http://ftp.gnu.org/gnu/make/make-4.2.1.tar.bz2
MAKE_4_2_1_SOURCE=$(LFS-SRC)/make-4.2.1.tar.bz2

define MAKE_4_2_1_SOURCE_CMDS  
	@echo "MAKE_4_2_1_TARGET_SOURCE"
endef

define MAKE_4_2_1_CONFIGURE_CMDS
	cd $(MAKE_4_2_1_DIR); \
	sed -i '211,217 d; 219,229 d; 232 d' glob/glob.c; \
	./configure --prefix=/usr
endef

define MAKE_4_2_1_BUILD_CMDS
	make -C $(MAKE_4_2_1_DIR)
endef

define MAKE_4_2_1_INSTALL_TARGET_CMDS
	cd $(MAKE_4_2_1_DIR); \
	[[ -z "$$LFSCHECK" ]] || make PERL5LIB=$$PWD/tests/ check; \
	make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))