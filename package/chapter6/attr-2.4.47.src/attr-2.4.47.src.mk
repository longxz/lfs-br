ATTR_2_4_47_SRC_URL=https://download.savannah.gnu.org/releases/attr/attr-2.4.47.src.tar.gz
ATTR_2_4_47_SRC_SOURCE=$(LFS-SRC)/attr-2.4.47.src.tar.gz

define ATTR_2_4_47_SRC_SOURCE_CMDS  
	@echo "ATTR_2_4_47_SRC_TARGET_SOURCE"
endef

define ATTR_2_4_47_SRC_CONFIGURE_CMDS
	cd $(ATTR_2_4_47_SRC_DIR); \
	sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in; \
	sed -i -e "/SUBDIRS/s|man[25]||g" man/Makefile; \
	sed -i 's:{(:\\{(:' test/run; \
	./configure --prefix=/usr \
		--bindir=/bin \
		--disable-static
endef

define ATTR_2_4_47_SRC_BUILD_CMDS
	make -C $(ATTR_2_4_47_SRC_DIR)
endef

define ATTR_2_4_47_SRC_INSTALL_TARGET_CMDS
	cd $(ATTR_2_4_47_SRC_DIR); \
	make -j1 tests root-tests; \
	make install install-dev install-lib; \
	chmod -v 755 /usr/lib/libattr.so; \
	mv -v /usr/lib/libattr.so.* /lib; \
	ln -sfv ../../lib/$$(readlink /usr/lib/libattr.so) /usr/lib/libattr.so
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))