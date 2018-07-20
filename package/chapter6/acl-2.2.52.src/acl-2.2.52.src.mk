ACL_2_2_52_SRC_URL=https://download.savannah.gnu.org/releases/acl/acl-2.2.52.src.tar.gz
ACL_2_2_52_SRC_SOURCE=$(LFS-SRC)/acl-2.2.52.src.tar.gz

define ACL_2_2_52_SRC_SOURCE_CMDS  
	@echo "ACL_2_2_52_SRC_TARGET_SOURCE"
endef

define ACL_2_2_52_SRC_CONFIGURE_CMDS
	cd $(ACL_2_2_52_SRC_DIR); \
	sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in; \
	sed -i "s:| sed.*::g" test/{sbits-restore,cp,misc}.test; \
	sed -i 's/{(/\\{(/' test/run; \
	sed -i -e "/TABS-1;/a if (x > (TABS-1)) x = (TABS-1);" libacl/__acl_to_any_text.c; \
	./configure --prefix=/usr \
		--bindir=/bin \
		--disable-static \
		--libexecdir=/usr/lib
endef

define ACL_2_2_52_SRC_BUILD_CMDS
	make -C $(ACL_2_2_52_SRC_DIR)
endef

define ACL_2_2_52_SRC_INSTALL_TARGET_CMDS
	cd $(ACL_2_2_52_SRC_DIR); \
	make install install-dev install-lib; \
	chmod -v 755 /usr/lib/libacl.so; \
	mv -v /usr/lib/libacl.so.* /lib; \
	ln -sfv ../../lib/$$(readlink /usr/lib/libacl.so) /usr/lib/libacl.so
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))