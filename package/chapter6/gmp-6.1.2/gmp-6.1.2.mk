GMP_6_1_2_URL=http://ftp.gnu.org/gnu/gmp/gmp-6.1.2.tar.xz
GMP_6_1_2_SOURCE=$(LFS-SRC)/gmp-6.1.2.tar.xz

define GMP_6_1_2_SOURCE_CMDS  
	@echo "GMP_6_1_2_TARGET_SOURCE"
endef

define GMP_6_1_2_CONFIGURE_CMDS
	cd $(GMP_6_1_2_DIR); \
	cp -v configfsf.guess config.guess; \
	cp -v configfsf.sub config.sub; \
	./configure --prefix=/usr \
		--enable-cxx \
		--disable-static \
		--docdir=/usr/share/doc/gmp-6.1.2
endef

define GMP_6_1_2_BUILD_CMDS
	cd $(GMP_6_1_2_DIR); \
	make; \
	make html
endef

define GMP_6_1_2_INSTALL_TARGET_CMDS
	cd $(GMP_6_1_2_DIR); \
	make check 2>&1 | tee gmp-check-log; \
	awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log ;\
	make install; \
	make install-html
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))