UTIL_LINUX_2_31_1_URL=https://www.kernel.org/pub/linux/utils/util-linux/v2.31/util-linux-2.31.1.tar.xz
UTIL_LINUX_2_31_1_SOURCE=$(LFS-SRC)/util-linux-2.31.1.tar.xz

define UTIL_LINUX_2_31_1_SOURCE_CMDS  
	@echo "UTIL_LINUX_2_31_1_TARGET_SOURCE"
endef

define UTIL_LINUX_2_31_1_CONFIGURE_CMDS
	cd $(UTIL_LINUX_2_31_1_DIR); \
	mkdir -pv /var/lib/hwclock; \
	./configure ADJTIME_PATH=/var/lib/hwclock/adjtime \
		--docdir=/usr/share/doc/util-linux-2.31.1 \
		--disable-chfn-chsh \
		--disable-login \
		--disable-nologin \
		--disable-su \
		--disable-setpriv \
		--disable-runuser \
		--disable-pylibmount \
		--disable-static \
		--without-python \
		--without-systemd \
		--without-systemdsystemunitdir
endef

define UTIL_LINUX_2_31_1_BUILD_CMDS
	make -C $(UTIL_LINUX_2_31_1_DIR)
endef

define UTIL_LINUX_2_31_1_INSTALL_TARGET_CMDS
	cd $(UTIL_LINUX_2_31_1_DIR); \
	chown -Rv nobody .; \
	su nobody -s /bin/bash -c "PATH=$$PATH make -k check"; \
	make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))