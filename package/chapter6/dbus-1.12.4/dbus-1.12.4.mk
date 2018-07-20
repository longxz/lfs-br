DBUS_1_12_4_URL=http://dbus.freedesktop.org/releases/dbus/dbus-1.12.4.tar.gz
DBUS_1_12_4_SOURCE=$(LFS-SRC)/dbus-1.12.4.tar.gz

define DBUS_1_12_4_SOURCE_CMDS  
	@echo "DBUS_1_12_4_TARGET_SOURCE"
endef

define DBUS_1_12_4_CONFIGURE_CMDS
	cd $(DBUS_1_12_4_DIR); ./configure --prefix=/usr
endef

define DBUS_1_12_4_BUILD_CMDS
	make -C $(DBUS_1_12_4_DIR)
endef

define DBUS_1_12_4_INSTALL_TARGET_CMDS
	cd $(DBUS_1_12_4_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))