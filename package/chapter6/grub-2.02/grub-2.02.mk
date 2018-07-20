GRUB_2_02_URL=http://ftp.gnu.org/gnu/grub/grub-2.02.tar.xz
GRUB_2_02_SOURCE=$(LFS-SRC)/grub-2.02.tar.xz

define GRUB_2_02_SOURCE_CMDS  
	@echo "GRUB_2_02_TARGET_SOURCE"
endef

define GRUB_2_02_CONFIGURE_CMDS
	cd $(GRUB_2_02_DIR); \
	./configure --prefix=/usr \
		--sbindir=/sbin \
		--sysconfdir=/etc \
		--disable-efiemu \
		--disable-werror
endef

define GRUB_2_02_BUILD_CMDS
	make -C $(GRUB_2_02_DIR)
endef

define GRUB_2_02_INSTALL_TARGET_CMDS
	cd $(GRUB_2_02_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))