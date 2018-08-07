GAWK_4_2_0_URL=http://ftp.gnu.org/gnu/gawk/gawk-4.2.0.tar.xz
GAWK_4_2_0_SOURCE=$(LFS-SRC)/gawk-4.2.0.tar.xz

define GAWK_4_2_0_SOURCE_CMDS  
	@echo "GAWK_4_2_0_TARGET_SOURCE"
endef

define GAWK_4_2_0_CONFIGURE_CMDS
	cd $(GAWK_4_2_0_DIR); \
	sed -i 's/extras//' Makefile.in; \
	./configure --prefix=/usr
endef

define GAWK_4_2_0_BUILD_CMDS
	make -C $(GAWK_4_2_0_DIR)
endef

define GAWK_4_2_0_INSTALL_TARGET_CMDS
	cd $(GAWK_4_2_0_DIR); \
	[[ -z "$$LFSCHECK" ]] || make check; \
	make install; \
	mkdir -v /usr/share/doc/gawk-4.2.0; \
	cp -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-4.2.0
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))