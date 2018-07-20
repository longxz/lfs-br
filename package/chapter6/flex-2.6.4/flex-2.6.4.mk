FLEX_2_6_4_URL=https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz
FLEX_2_6_4_SOURCE=$(LFS-SRC)/flex-2.6.4.tar.gz

define FLEX_2_6_4_SOURCE_CMDS  
	@echo "FLEX_2_6_4_TARGET_SOURCE"
endef

define FLEX_2_6_4_CONFIGURE_CMDS
	cd $(FLEX_2_6_4_DIR); \
	sed -i "/math.h/a #include <malloc.h>" src/flexdef.h; \
	HELP2MAN=/tools/bin/true; \
	./configure --prefix=/usr --docdir=/usr/share/doc/flex-2.6.4
endef

define FLEX_2_6_4_BUILD_CMDS
	make -C $(FLEX_2_6_4_DIR)
endef

define FLEX_2_6_4_INSTALL_TARGET_CMDS
	cd $(FLEX_2_6_4_DIR); \
	make check; \
	make install; \
	ln -sv flex /usr/bin/lex
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))