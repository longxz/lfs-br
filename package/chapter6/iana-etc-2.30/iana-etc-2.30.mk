IANA_ETC_2_30_URL=http://anduin.linuxfromscratch.org/LFS/iana-etc-2.30.tar.bz2
IANA_ETC_2_30_SOURCE=$(LFS-SRC)/iana-etc-2.30.tar.bz2

define IANA_ETC_2_30_SOURCE_CMDS  
	@echo "IANA_ETC_2_30_TARGET_SOURCE"
endef

define IANA_ETC_2_30_CONFIGURE_CMDS
	cd $(IANA_ETC_2_30_DIR); ./configure --prefix=/tools
endef

define IANA_ETC_2_30_BUILD_CMDS
	make -C $(IANA_ETC_2_30_DIR)
endef

define IANA_ETC_2_30_INSTALL_TARGET_CMDS
	cd $(IANA_ETC_2_30_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))