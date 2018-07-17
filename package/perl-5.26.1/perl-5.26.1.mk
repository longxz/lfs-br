PERL_5_26_1_URL=http://www.cpan.org/src/5.0/perl-5.26.1.tar.xz
PERL_5_26_1_SOURCE=$(LFS-SRC)/perl-5.26.1.tar.xz

define PERL_5_26_1_SOURCE_CMDS  
	@echo "PERL_5_26_1_TARGET_SOURCE"
endef

define PERL_5_26_1_CONFIGURE_CMDS
	cd $(PERL_5_26_1_DIR); ./configure --prefix=/tools
endef

define PERL_5_26_1_BUILD_CMDS
	make -C $(PERL_5_26_1_DIR)
endef

define PERL_5_26_1_INSTALL_TARGET_CMDS
	cd $(PERL_5_26_1_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))