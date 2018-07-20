EUDEV_3_2_5_URL=http://dev.gentoo.org/~blueness/eudev/eudev-3.2.5.tar.gz
EUDEV_3_2_5_SOURCE=$(LFS-SRC)/eudev-3.2.5.tar.gz

define EUDEV_3_2_5_SOURCE_CMDS  
	@echo "EUDEV_3_2_5_TARGET_SOURCE"
endef

define EUDEV_3_2_5_CONFIGURE_CMDS
	cd $(EUDEV_3_2_5_DIR); \
	sed -r -i 's|/usr(/bin/test)|\1|' test/udev-test.pl; \

	echo 'HAVE_BLKID=1\nBLKID_LIBS="-lblkid"\n`BLKID_CFLAGS="-I/tools/include"' > config.cache

	./configure --prefix=/usr \
		--bindir=/sbin \
		--sbindir=/sbin \
		--libdir=/usr/lib \
		--sysconfdir=/etc \
		--libexecdir=/lib \
		--with-rootprefix= \
		--with-rootlibdir=/lib \
		--enable-manpages \
		--disable-static \
		--config-cache
endef

define EUDEV_3_2_5_BUILD_CMDS
	cd $(EUDEV_3_2_5_DIR); \
	LIBRARY_PATH=/tools/lib make
endef

define EUDEV_3_2_5_INSTALL_TARGET_CMDS
	cd $(EUDEV_3_2_5_DIR); \
	mkdir -pv /lib/udev/rules.d; \
	mkdir -pv /etc/udev/rules.d; \
	make LD_LIBRARY_PATH=/tools/lib check; \
	make LD_LIBRARY_PATH=/tools/lib install; \
	tar -xvf ../udev-lfs-20171102.tar.bz2; \
	make -f udev-lfs-20171102/Makefile.lfs install; \
	LD_LIBRARY_PATH=/tools/lib udevadm hwdb --update
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))