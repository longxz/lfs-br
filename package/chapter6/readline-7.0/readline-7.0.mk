READLINE_7_0_URL=http://ftp.gnu.org/gnu/readline/readline-7.0.tar.gz
READLINE_7_0_SOURCE=$(LFS-SRC)/readline-7.0.tar.gz

define READLINE_7_0_SOURCE_CMDS  
	@echo "READLINE_7_0_TARGET_SOURCE"
endef

define READLINE_7_0_CONFIGURE_CMDS
	cd $(READLINE_7_0_DIR); \
	sed -i '/MV.*old/d' Makefile.in; \
	sed -i '/{OLDSUFF}/c:' support/shlib-install; \
	./configure --prefix=/usr \
		--disable-static \
		--docdir=/usr/share/doc/readline-7.0
endef

define READLINE_7_0_BUILD_CMDS
	make -C $(READLINE_7_0_DIR); \
	make SHLIB_LIBS="-L/tools/lib -lncursesw"
endef

define READLINE_7_0_INSTALL_TARGET_CMDS
	cd $(READLINE_7_0_DIR); \
	make SHLIB_LIBS="-L/tools/lib -lncurses" install; \
	mv -v /usr/lib/lib{readline,history}.so.* /lib; \
	ln -sfv ../../lib/$$(readlink /usr/lib/libreadline.so) /usr/lib/libreadline.so; \
	ln -sfv ../../lib/$$(readlink /usr/lib/libhistory.so ) /usr/lib/libhistory.so; \
	install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-7.0
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))