EXPAT_2_2_5_URL=http://prdownloads.sourceforge.net/expat/expat-2.2.5.tar.bz2
EXPAT_2_2_5_SOURCE=$(LFS-SRC)/expat-2.2.5.tar.bz2

define EXPAT_2_2_5_SOURCE_CMDS  
	@echo "EXPAT_2_2_5_TARGET_SOURCE"
endef

define EXPAT_2_2_5_CONFIGURE_CMDS
	cd $(EXPAT_2_2_5_DIR); \
	sed -i 's|usr/bin/env |bin/|' run.sh.in; \
	./configure --prefix=/usr --disable-static
endef

define EXPAT_2_2_5_BUILD_CMDS
	make -C $(EXPAT_2_2_5_DIR)
endef

define EXPAT_2_2_5_INSTALL_TARGET_CMDS
	cd $(EXPAT_2_2_5_DIR); \
	make check; \
	make install; \
	install -v -dm755 /usr/share/doc/expat-2.2.5; \
	install -v -m644 doc/*.{html,png,css} /usr/share/doc/expat-2.2.5
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))