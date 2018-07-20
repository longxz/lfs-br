MAN_DB_2_8_1_URL=https://download.savannah.gnu.org/releases/man-db/man-db-2.8.1.tar.xz
MAN_DB_2_8_1_SOURCE=$(LFS-SRC)/man-db-2.8.1.tar.xz

define MAN_DB_2_8_1_SOURCE_CMDS  
	@echo "MAN_DB_2_8_1_TARGET_SOURCE"
endef

define MAN_DB_2_8_1_CONFIGURE_CMDS
	cd $(MAN_DB_2_8_1_DIR); \
	./configure --prefix=/usr \
		--docdir=/usr/share/doc/man-db-2.8.1 \
		--sysconfdir=/etc \
		--disable-setuid \
		--enable-cache-owner=bin \
		--with-browser=/usr/bin/lynx \
		--with-vgrind=/usr/bin/vgrind \
		--with-grap=/usr/bin/grap \
		--with-systemdtmpfilesdir=
endef

define MAN_DB_2_8_1_BUILD_CMDS
	make -C $(MAN_DB_2_8_1_DIR)
endef

define MAN_DB_2_8_1_INSTALL_TARGET_CMDS
	cd $(MAN_DB_2_8_1_DIR); \
	make check; \
	make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))