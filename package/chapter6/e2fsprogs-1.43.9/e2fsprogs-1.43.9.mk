E2FSPROGS_1_43_9_URL=http://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v1.43.9/e2fsprogs-1.43.9.tar.gz
E2FSPROGS_1_43_9_SOURCE=$(LFS-SRC)/e2fsprogs-1.43.9.tar.gz

define E2FSPROGS_1_43_9_SOURCE_CMDS  
	@echo "E2FSPROGS_1_43_9_TARGET_SOURCE"
endef

define E2FSPROGS_1_43_9_CONFIGURE_CMDS
	cd $(E2FSPROGS_1_43_9_DIR); 
	mkdir -v build; \
	cd build;
	LIBS=-L/tools/lib \
	CFLAGS=-I/tools/include \
	PKG_CONFIG_PATH=/tools/lib/pkgconfig \
		../configure --prefix=/usr \
		--bindir=/bin \
		--with-root-prefix="" \
		--enable-elf-shlibs \
		--disable-libblkid \
		--disable-libuuid \
		--disable-uuidd \
		--disable-fsck
endef

define E2FSPROGS_1_43_9_BUILD_CMDS
	make -C $(E2FSPROGS_1_43_9_DIR)
endef

define E2FSPROGS_1_43_9_INSTALL_TARGET_CMDS
	cd $(E2FSPROGS_1_43_9_DIR); \
	ln -sfv /tools/lib/lib{blk,uu}id.so.1 lib; \
	make LD_LIBRARY_PATH=/tools/lib check; \
	make install; \
	make install-libs; \
	chmod -v u+w /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a; \
	gunzip -v /usr/share/info/libext2fs.info.gz; \
	install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info; \
	makeinfo -o doc/com_err.info ../lib/et/com_err.texinfo; \
	install -v -m644 doc/com_err.info /usr/share/info; \
	install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))