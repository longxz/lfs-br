PSMISC_23_1_URL=https://sourceforge.net/projects/psmisc/files/psmisc/psmisc-23.1.tar.xz
PSMISC_23_1_SOURCE=$(LFS-SRC)/psmisc-23.1.tar.xz

define PSMISC_23_1_SOURCE_CMDS  
	@echo "PSMISC_23_1_TARGET_SOURCE"
endef

define PSMISC_23_1_CONFIGURE_CMDS
	cd $(PSMISC_23_1_DIR); ./configure --prefix=/usr
endef

define PSMISC_23_1_BUILD_CMDS
	make -C $(PSMISC_23_1_DIR)
endef

define PSMISC_23_1_INSTALL_TARGET_CMDS
	cd $(PSMISC_23_1_DIR); \
	make install; \
	mv -v /usr/bin/fuser /bin; \
	mv -v /usr/bin/killall /bin
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))