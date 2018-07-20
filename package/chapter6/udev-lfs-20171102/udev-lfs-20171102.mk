UDEV_LFS_20171102_URL=http://anduin.linuxfromscratch.org/LFS/udev-lfs-20171102.tar.bz2
UDEV_LFS_20171102_SOURCE=$(LFS-SRC)/udev-lfs-20171102.tar.bz2

define UDEV_LFS_20171102_SOURCE_CMDS  
	@echo "UDEV_LFS_20171102_TARGET_SOURCE"
endef

define UDEV_LFS_20171102_CONFIGURE_CMDS
	cd $(UDEV_LFS_20171102_DIR); ./configure --prefix=/usr
endef

define UDEV_LFS_20171102_BUILD_CMDS
	make -C $(UDEV_LFS_20171102_DIR)
endef

define UDEV_LFS_20171102_INSTALL_TARGET_CMDS
	cd $(UDEV_LFS_20171102_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))