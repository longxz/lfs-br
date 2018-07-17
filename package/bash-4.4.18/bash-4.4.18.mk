BASH_4_4_18_URL=http://ftp.gnu.org/gnu/bash/bash-4.4.18.tar.gz
BASH_4_4_18_SOURCE=$(LFS-SRC)/bash-4.4.18.tar.gz

define BASH_4_4_18_SOURCE_CMDS  
	@echo "BASH_4_4_18_TARGET_SOURCE"
endef

define BASH_4_4_18_CONFIGURE_CMDS
	cd $(BASH_4_4_18_DIR); ./configure --prefix=/tools
endef

define BASH_4_4_18_BUILD_CMDS
	make -C $(BASH_4_4_18_DIR)
endef

define BASH_4_4_18_INSTALL_TARGET_CMDS
	cd $(BASH_4_4_18_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))