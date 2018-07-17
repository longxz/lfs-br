OPENSSL_1_1_0G_URL=https://openssl.org/source/openssl-1.1.0g.tar.gz
OPENSSL_1_1_0G_SOURCE=$(LFS-SRC)/openssl-1.1.0g.tar.gz

define OPENSSL_1_1_0G_SOURCE_CMDS  
	@echo "OPENSSL_1_1_0G_TARGET_SOURCE"
endef

define OPENSSL_1_1_0G_CONFIGURE_CMDS
	cd $(OPENSSL_1_1_0G_DIR); ./configure --prefix=/tools
endef

define OPENSSL_1_1_0G_BUILD_CMDS
	make -C $(OPENSSL_1_1_0G_DIR)
endef

define OPENSSL_1_1_0G_INSTALL_TARGET_CMDS
	cd $(OPENSSL_1_1_0G_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))