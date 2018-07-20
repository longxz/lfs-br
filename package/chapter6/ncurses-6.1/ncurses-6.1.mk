NCURSES_6_1_URL=http://ftp.gnu.org/gnu//ncurses/ncurses-6.1.tar.gz
NCURSES_6_1_SOURCE=$(LFS-SRC)/ncurses-6.1.tar.gz

define NCURSES_6_1_SOURCE_CMDS  
	@echo "NCURSES_6_1_TARGET_SOURCE"
endef

define NCURSES_6_1_CONFIGURE_CMDS
	cd $(NCURSES_6_1_DIR); \
	sed -i '/LIBTOOL_INSTALL/d' c++/Makefile.in \
	./configure --prefix=/usr \
		--mandir=/usr/share/man \
		--with-shared \
		--without-debug \
		--without-normal \
		--enable-pc-files \
		--enable-widec
endef

define NCURSES_6_1_BUILD_CMDS
	make -C $(NCURSES_6_1_DIR)
endef

define NCURSES_6_1_INSTALL_TARGET_CMDS
	cd $(NCURSES_6_1_DIR); \
	make install; \
	mv -v /usr/lib/libncursesw.so.6* /lib; \
	ln -sfv ../../lib/$$(readlink /usr/lib/libncursesw.so) /usr/lib/libncursesw.so; \
	for lib in ncurses form panel menu ; do \
		rm -vf /usr/lib/lib${lib}.so \
		echo "INPUT(-l${lib}w)" > /usr/lib/lib${lib}.so \
		ln -sfv ${lib}w.pc /usr/lib/pkgconfig/${lib}.pc \
	done; \
	rm -vf /usr/lib/libcursesw.so; \
	echo "INPUT(-lncursesw)" > /usr/lib/libcursesw.so; \
	ln -sfv libncurses.so /usr/lib/libcurses.so; \
	mkdir -v /usr/share/doc/ncurses-6.1; \
	cp -v -R doc/* /usr/share/doc/ncurses-6.1
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))