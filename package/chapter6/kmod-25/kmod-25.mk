KMOD_25_URL=https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-25.tar.xz
KMOD_25_SOURCE=$(LFS-SRC)/kmod-25.tar.xz

define KMOD_25_SOURCE_CMDS  
	@echo "KMOD_25_TARGET_SOURCE"
endef

define KMOD_25_CONFIGURE_CMDS
	cd $(KMOD_25_DIR); \
	./configure --prefix=/usr \
		--bindir=/bin \
		--sysconfdir=/etc \
		--with-rootlibdir=/lib \
		--with-xz \
		--with-zlib
endef

define KMOD_25_BUILD_CMDS
	make -C $(KMOD_25_DIR)
endef

define KMOD_25_INSTALL_TARGET_CMDS
	cd $(KMOD_25_DIR); \
	make install; \
	for target in depmod insmod lsmod modinfo modprobe rmmod; do \
		ln -sfv ../bin/kmod /sbin/$$target; \
	done; \
	ln -sfv kmod /bin/lsmod;
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))