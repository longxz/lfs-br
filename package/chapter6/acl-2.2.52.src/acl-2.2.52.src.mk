ACL_2_2_52_SRC_URL=https://download.savannah.gnu.org/releases/acl/acl-2.2.52.src.tar.gz
ACL_2_2_52_SRC_SOURCE=$(LFS-SRC)/acl-2.2.52.src.tar.gz

define ACL_2_2_52_SRC_SOURCE_CMDS  
	@echo "ACL_2_2_52_SRC_TARGET_SOURCE"
endef

define ACL_2_2_52_SRC_CONFIGURE_CMDS
	cd $(ACL_2_2_52_SRC_DIR); ./configure --prefix=/tools
endef

define ACL_2_2_52_SRC_BUILD_CMDS
	make -C $(ACL_2_2_52_SRC_DIR)
endef

define ACL_2_2_52_SRC_INSTALL_TARGET_CMDS
	cd $(ACL_2_2_52_SRC_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))