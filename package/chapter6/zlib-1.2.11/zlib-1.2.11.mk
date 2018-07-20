ZLIB_1_2_11_URL=http://zlib.net/zlib-1.2.11.tar.xz
ZLIB_1_2_11_SOURCE=$(LFS-SRC)/zlib-1.2.11.tar.xz

define ZLIB_1_2_11_SOURCE_CMDS  
	@echo "ZLIB_1_2_11_TARGET_SOURCE"
endef

define ZLIB_1_2_11_CONFIGURE_CMDS
	cd $(ZLIB_1_2_11_DIR); ./configure --prefix=/usr
endef

define ZLIB_1_2_11_BUILD_CMDS
	make -C $(ZLIB_1_2_11_DIR)
endef

define ZLIB_1_2_11_INSTALL_TARGET_CMDS
	cd $(ZLIB_1_2_11_DIR); \
	make check; \
	make install; \
	mv -v /usr/lib/libz.so.* /lib; \
	ln -sfv ../../lib/$$(readlink /usr/lib/libz.so) /usr/lib/libz.so
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))