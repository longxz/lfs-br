MPFR_4_0_1_URL=http://www.mpfr.org/mpfr-4.0.1/mpfr-4.0.1.tar.xz
MPFR_4_0_1_SOURCE=$(LFS-SRC)/mpfr-4.0.1.tar.xz

define MPFR_4_0_1_SOURCE_CMDS  
	@echo "MPFR_4_0_1_TARGET_SOURCE"
endef

define MPFR_4_0_1_CONFIGURE_CMDS
	cd $(MPFR_4_0_1_DIR); \
	./configure --prefix=/usr \
		--disable-static \
		--enable-thread-safe \
		--docdir=/usr/share/doc/mpfr-4.0.1
endef

define MPFR_4_0_1_BUILD_CMDS
	cd $(MPFR_4_0_1_DIR); \
	make; \
	make html
endef

define MPFR_4_0_1_INSTALL_TARGET_CMDS
	cd $(MPFR_4_0_1_DIR); \
	make check; \
	make install; \
	make install-html
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))