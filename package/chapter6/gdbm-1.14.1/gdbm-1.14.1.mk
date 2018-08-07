GDBM_1_14_1_URL=http://ftp.gnu.org/gnu/gdbm/gdbm-1.14.1.tar.gz
GDBM_1_14_1_SOURCE=$(LFS-SRC)/gdbm-1.14.1.tar.gz

define GDBM_1_14_1_SOURCE_CMDS  
	@echo "GDBM_1_14_1_TARGET_SOURCE"
endef

define GDBM_1_14_1_CONFIGURE_CMDS
	cd $(GDBM_1_14_1_DIR); \
	./configure --prefix=/usr \
		--disable-static \
		--enable-libgdbm-compat
endef

define GDBM_1_14_1_BUILD_CMDS
	make -C $(GDBM_1_14_1_DIR)
endef

define GDBM_1_14_1_INSTALL_TARGET_CMDS
	cd $(GDBM_1_14_1_DIR); \
	[[ -z "$$LFSCHECK" ]] || make check; \
	make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))