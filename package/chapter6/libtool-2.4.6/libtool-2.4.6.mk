LIBTOOL_2_4_6_URL=http://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz
LIBTOOL_2_4_6_SOURCE=$(LFS-SRC)/libtool-2.4.6.tar.xz

define LIBTOOL_2_4_6_SOURCE_CMDS  
	@echo "LIBTOOL_2_4_6_TARGET_SOURCE"
endef

define LIBTOOL_2_4_6_CONFIGURE_CMDS
	cd $(LIBTOOL_2_4_6_DIR); ./configure --prefix=/tools
endef

define LIBTOOL_2_4_6_BUILD_CMDS
	make -C $(LIBTOOL_2_4_6_DIR)
endef

define LIBTOOL_2_4_6_INSTALL_TARGET_CMDS
	cd $(LIBTOOL_2_4_6_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))