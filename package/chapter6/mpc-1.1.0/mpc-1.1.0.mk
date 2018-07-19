MPC_1_1_0_URL=https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz
MPC_1_1_0_SOURCE=$(LFS-SRC)/mpc-1.1.0.tar.gz

define MPC_1_1_0_SOURCE_CMDS  
	@echo "MPC_1_1_0_TARGET_SOURCE"
endef

define MPC_1_1_0_CONFIGURE_CMDS
	cd $(MPC_1_1_0_DIR); ./configure --prefix=/tools
endef

define MPC_1_1_0_BUILD_CMDS
	make -C $(MPC_1_1_0_DIR)
endef

define MPC_1_1_0_INSTALL_TARGET_CMDS
	cd $(MPC_1_1_0_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))