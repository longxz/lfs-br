GZIP_1_9_URL=http://ftp.gnu.org/gnu/gzip/gzip-1.9.tar.xz
GZIP_1_9_SOURCE=$(LFS-SRC)/gzip-1.9.tar.xz

define GZIP_1_9_SOURCE_CMDS  
	@echo "GZIP_1_9_TARGET_SOURCE"
endef

define GZIP_1_9_CONFIGURE_CMDS
	cd $(GZIP_1_9_DIR); ./configure --prefix=/usr
endef

define GZIP_1_9_BUILD_CMDS
	make -C $(GZIP_1_9_DIR)
endef

define GZIP_1_9_INSTALL_TARGET_CMDS
	cd $(GZIP_1_9_DIR); \
	[[ -z "$$LFSCHECK" ]] || make check; \
	make install; \
	mv -v /usr/bin/gzip /bin
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))