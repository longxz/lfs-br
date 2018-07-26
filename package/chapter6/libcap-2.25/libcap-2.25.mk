LIBCAP_2_25_URL=https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.25.tar.xz
LIBCAP_2_25_SOURCE=$(LFS-SRC)/libcap-2.25.tar.xz

define LIBCAP_2_25_SOURCE_CMDS  
	@echo "LIBCAP_2_25_TARGET_SOURCE"
endef

define LIBCAP_2_25_CONFIGURE_CMDS
	cd $(LIBCAP_2_25_DIR); \
	sed -i '/install.*STALIBNAME/d' libcap/Makefile;
endef

define LIBCAP_2_25_BUILD_CMDS
	make -C $(LIBCAP_2_25_DIR)
endef

define LIBCAP_2_25_INSTALL_TARGET_CMDS
	cd $(LIBCAP_2_25_DIR); \
	make RAISE_SETFCAP=no lib=lib prefix=/usr install; \
	chmod -v 755 /usr/lib/libcap.so; \
	mv -v /usr/lib/libcap.so.* /lib; \
	ln -sfv ../../lib/$$(readlink /usr/lib/libcap.so) /usr/lib/libcap.so
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))