COREUTILS_8_29_URL=http://ftp.gnu.org/gnu/coreutils/coreutils-8.29.tar.xz
COREUTILS_8_29_SOURCE=$(LFS-SRC)/coreutils-8.29.tar.xz

define COREUTILS_8_29_SOURCE_CMDS  
	@echo "COREUTILS_8_29_TARGET_SOURCE"
endef

define COREUTILS_8_29_CONFIGURE_CMDS
	cd $(COREUTILS_8_29_DIR); \
	patch -Np1 -i ../coreutils-8.29-i18n-1.patch; \
	sed -i '/test.lock/s/^/#/' gnulib-tests/gnulib.mk; \
	FORCE_UNSAFE_CONFIGURE=1 ./configure \
		--prefix=/usr \
		--enable-no-install-program=kill,uptime
endef

define COREUTILS_8_29_BUILD_CMDS
	cd $(COREUTILS_8_29_DIR); \
	FORCE_UNSAFE_CONFIGURE=1 make
endef

define COREUTILS_8_29_INSTALL_TARGET_CMDS
	cd $(COREUTILS_8_29_DIR); \
	make NON_ROOT_USERNAME=nobody check-root; \
	echo "dummy:x:1000:nobody" >> /etc/group; \
	chown -Rv nobody .;\
	su nobody -s /bin/bash \
 -c "PATH=$$PATH make RUN_EXPENSIVE_TESTS=yes check"; \
 	sed -i '/dummy/d' /etc/group; \
	make install; \
	mv -v /usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} /bin; \
	mv -v /usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm} /bin; \
	mv -v /usr/bin/{rmdir,stty,sync,true,uname} /bin; \
	mv -v /usr/bin/chroot /usr/sbin; \
	mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8; \
	sed -i s/\"1\"/\"8\"/1 /usr/share/man/man8/chroot.8; \
	mv -v /usr/bin/{head,sleep,nice} /bin
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))