BISON_3_0_4_URL=http://ftp.gnu.org/gnu/bison/bison-3.0.4.tar.xz
BISON_3_0_4_SOURCE=$(LFS-SRC)/bison-3.0.4.tar.xz

define BISON_3_0_4_SOURCE_CMDS  
	@echo "BISON_3_0_4_TARGET_SOURCE"
endef

define BISON_3_0_4_CONFIGURE_CMDS
	cd $(BISON_3_0_4_DIR); ./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.0.4
endef

define BISON_3_0_4_BUILD_CMDS
	make -C $(BISON_3_0_4_DIR)
endef

define BISON_3_0_4_INSTALL_TARGET_CMDS
	cd $(BISON_3_0_4_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))