EXPECT5_45_4_URL=http://prdownloads.sourceforge.net/expect/expect5.45.4.tar.gz
EXPECT5_45_4_SOURCE=$(LFS-SRC)/expect5.45.4.tar.gz

define EXPECT5_45_4_SOURCE_CMDS  
	@echo "EXPECT5_45_4_TARGET_SOURCE"
endef

define EXPECT5_45_4_CONFIGURE_CMDS
	cd $(EXPECT5_45_4_DIR); \
	cp -v configure{,.orig}; \
	sed 's:/usr/local/bin:/bin:' configure.orig > configure; \
	./configure --prefix=/tools \
		--with-tcl=/tools/lib \
		--with-tclinclude=/tools/include
endef

define EXPECT5_45_4_BUILD_CMDS
	cd $(EXPECT5_45_4_DIR); \
	make
endef

define EXPECT5_45_4_INSTALL_TARGET_CMDS
	cd $(EXPECT5_45_4_DIR); \
	[[ -z "$$LFSCHECK" ]] || make test; \
	make SCRIPTS="" install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))