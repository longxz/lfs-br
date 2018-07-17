TCL8_6_8_SRC_URL=https://downloads.sourceforge.net/tcl/tcl8.6.8-src.tar.gz
TCL8_6_8_SRC_SOURCE=$(LFS-SRC)/tcl8.6.8-src.tar.gz

define TCL8_6_8_SRC_SOURCE_CMDS  
	@echo "TCL8_6_8_SRC_TARGET_SOURCE"
endef

define TCL8_6_8_SRC_CONFIGURE_CMDS
	cd $(TCL8_6_8_SRC_DIR); ./configure --prefix=/tools
endef

define TCL8_6_8_SRC_BUILD_CMDS
	make -C $(TCL8_6_8_SRC_DIR)
endef

define TCL8_6_8_SRC_INSTALL_TARGET_CMDS
	cd $(TCL8_6_8_SRC_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))