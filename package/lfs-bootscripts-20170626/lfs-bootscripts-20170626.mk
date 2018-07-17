LFS_BOOTSCRIPTS_20170626_URL=http://www.linuxfromscratch.org/lfs/downloads/8.2/lfs-bootscripts-20170626.tar.bz2
LFS_BOOTSCRIPTS_20170626_SOURCE=$(LFS-SRC)/lfs-bootscripts-20170626.tar.bz2

define LFS_BOOTSCRIPTS_20170626_SOURCE_CMDS  
	@echo "LFS_BOOTSCRIPTS_20170626_TARGET_SOURCE"
endef

define LFS_BOOTSCRIPTS_20170626_CONFIGURE_CMDS
	cd $(LFS_BOOTSCRIPTS_20170626_DIR); ./configure --prefix=/tools
endef

define LFS_BOOTSCRIPTS_20170626_BUILD_CMDS
	make -C $(LFS_BOOTSCRIPTS_20170626_DIR)
endef

define LFS_BOOTSCRIPTS_20170626_INSTALL_TARGET_CMDS
	cd $(LFS_BOOTSCRIPTS_20170626_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))