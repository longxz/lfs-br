KBD_2_0_4_URL=https://www.kernel.org/pub/linux/utils/kbd/kbd-2.0.4.tar.xz
KBD_2_0_4_SOURCE=$(LFS-SRC)/kbd-2.0.4.tar.xz

define KBD_2_0_4_SOURCE_CMDS  
	@echo "KBD_2_0_4_TARGET_SOURCE"
endef

define KBD_2_0_4_CONFIGURE_CMDS
	cd $(KBD_2_0_4_DIR); \
	patch -Np1 -i ../kbd-2.0.4-backspace-1.patch; \
	sed -i 's/\(RESIZECONS_PROGS=\)yes/\1no/g' configure; \
	sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in; \
	PKG_CONFIG_PATH=/tools/lib/pkgconfig ./configure --prefix=/usr --disable-vlock
endef

define KBD_2_0_4_BUILD_CMDS
	make -C $(KBD_2_0_4_DIR)
endef

define KBD_2_0_4_INSTALL_TARGET_CMDS
	cd $(KBD_2_0_4_DIR); \
	make check; \
	make install; \
	mkdir -v /usr/share/doc/kbd-2.0.4; \
	cp -R -v docs/doc/* /usr/share/doc/kbd-2.0.4
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))