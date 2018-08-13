INETUTILS_1_9_4_URL=http://ftp.gnu.org/gnu/inetutils/inetutils-1.9.4.tar.xz
INETUTILS_1_9_4_SOURCE=$(LFS-SRC)/inetutils-1.9.4.tar.xz

define INETUTILS_1_9_4_SOURCE_CMDS  
	@echo "INETUTILS_1_9_4_TARGET_SOURCE"
endef

define INETUTILS_1_9_4_CONFIGURE_CMDS
	cd $(INETUTILS_1_9_4_DIR); \
	patch -p1 < $(ROOTDIR)/patches/inetutils-1.9.4-ifconfig-system-linux-c.patch
	./configure --prefix=/usr \
		--localstatedir=/var \
		--disable-logger \
		--disable-whois \
		--disable-rcp \
		--disable-rexec \
		--disable-rlogin \
		--disable-rsh \
		--disable-servers
endef

define INETUTILS_1_9_4_BUILD_CMDS
	make -C $(INETUTILS_1_9_4_DIR)
endef

define INETUTILS_1_9_4_INSTALL_TARGET_CMDS
	cd $(INETUTILS_1_9_4_DIR); \
	[[ -z "$$LFSCHECK" ]] || make check; \
	make install; \
	mv -v /usr/bin/{hostname,ping,ping6,traceroute} /bin; \
	mv -v /usr/bin/ifconfig /sbin
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))