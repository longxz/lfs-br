FILE_5_32_URL=ftp://ftp.astron.com/pub/file/file-5.32.tar.gz
FILE_5_32_SOURCE=$(LFS-SRC)/file-5.32.tar.gz

define FILE_5_32_SOURCE_CMDS  
	@echo "FILE_5_32_TARGET_SOURCE"
endef

define FILE_5_32_CONFIGURE_CMDS
	cd $(FILE_5_32_DIR); ./configure --prefix=/usr
endef

define FILE_5_32_BUILD_CMDS
	make -C $(FILE_5_32_DIR)
endef

define FILE_5_32_INSTALL_TARGET_CMDS
	cd $(FILE_5_32_DIR); \
	make check; \
	make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))