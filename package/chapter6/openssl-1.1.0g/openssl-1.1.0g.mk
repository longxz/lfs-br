OPENSSL_1_1_0G_URL=https://openssl.org/source/openssl-1.1.0g.tar.gz
OPENSSL_1_1_0G_SOURCE=$(LFS-SRC)/openssl-1.1.0g.tar.gz

define OPENSSL_1_1_0G_SOURCE_CMDS  
	@echo "OPENSSL_1_1_0G_TARGET_SOURCE"
endef

define OPENSSL_1_1_0G_CONFIGURE_CMDS
	cd $(OPENSSL_1_1_0G_DIR); \
	./config --prefix=/usr \
		--openssldir=/etc/ssl \
		--libdir=lib \
		shared \
		zlib-dynamic
endef

define OPENSSL_1_1_0G_BUILD_CMDS
	make -C $(OPENSSL_1_1_0G_DIR)
endef

define OPENSSL_1_1_0G_INSTALL_TARGET_CMDS
	cd $(OPENSSL_1_1_0G_DIR); \
	make test; \
	sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile; \
	make MANSUFFIX=ssl install; \
	mv -v /usr/share/doc/openssl /usr/share/doc/openssl-1.1.0g; \
	cp -vfr doc/* /usr/share/doc/openssl-1.1.0g
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))