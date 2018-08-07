PROCPS_NG_3_3_12_URL=http://sourceforge.net/projects/procps-ng/files/Production/procps-ng-3.3.12.tar.xz
PROCPS_NG_3_3_12_SOURCE=$(LFS-SRC)/procps-ng-3.3.12.tar.xz

define PROCPS_NG_3_3_12_SOURCE_CMDS  
	@echo "PROCPS_NG_3_3_12_TARGET_SOURCE"
endef

define PROCPS_NG_3_3_12_CONFIGURE_CMDS
	cd $(PROCPS_NG_3_3_12_DIR); \
	./configure --prefix=/usr \
	--exec-prefix= \
	--libdir=/usr/lib \
	--docdir=/usr/share/doc/procps-ng-3.3.12 \
	--disable-static \
	--disable-kill
endef

define PROCPS_NG_3_3_12_BUILD_CMDS
	make -C $(PROCPS_NG_3_3_12_DIR)
endef

define PROCPS_NG_3_3_12_INSTALL_TARGET_CMDS
	cd $(PROCPS_NG_3_3_12_DIR); \
	sed -i -r 's|(pmap_initname)\\\$$|\1|'; \ testsuite/pmap.test/pmap.exp; \
	sed -i '/set tty/d' testsuite/pkill.test/pkill.exp; \
	rm testsuite/pgrep.test/pgrep.exp; \
	[[ -z "$$LFSCHECK" ]] || make check; \
	make install; \
	mv -v /usr/lib/libprocps.so.* /lib; \
	ln -sfv ../../lib/$$(readlink /usr/lib/libprocps.so) /usr/lib/libprocps.so
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))