MAN_DB_2_8_1_URL=https://download.savannah.gnu.org/releases/man-db/man-db-2.8.1.tar.xz
MAN_DB_2_8_1_SOURCE=$(LFS-SRC)/man-db-2.8.1.tar.xz

define MAN_DB_2_8_1_SOURCE_CMDS  
	@echo "MAN_DB_2_8_1_TARGET_SOURCE"
endef

define MAN_DB_2_8_1_CONFIGURE_CMDS
	cd $(MAN_DB_2_8_1_DIR); ./configure --prefix=/tools
endef

define MAN_DB_2_8_1_BUILD_CMDS
	make -C $(MAN_DB_2_8_1_DIR)
endef

define MAN_DB_2_8_1_INSTALL_TARGET_CMDS
	cd $(MAN_DB_2_8_1_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))