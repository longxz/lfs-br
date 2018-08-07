TAR_1_30_URL=http://ftp.gnu.org/gnu/tar/tar-1.30.tar.xz
TAR_1_30_SOURCE=$(LFS-SRC)/tar-1.30.tar.xz

define TAR_1_30_SOURCE_CMDS  
	@echo "TAR_1_30_TARGET_SOURCE"
endef

define TAR_1_30_CONFIGURE_CMDS
	cd $(TAR_1_30_DIR); \
	FORCE_UNSAFE_CONFIGURE=1 \
	./configure --prefix=/usr \
 		--bindir=/bin
endef

define TAR_1_30_BUILD_CMDS
	make -C $(TAR_1_30_DIR)
endef

define TAR_1_30_INSTALL_TARGET_CMDS
	cd $(TAR_1_30_DIR); \
	[[ -z "$$LFSCHECK" ]] || make check; \
	make install; \
	make -C doc install-html docdir=/usr/share/doc/tar-1.30
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))