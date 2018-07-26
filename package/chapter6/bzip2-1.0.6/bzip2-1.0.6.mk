BZIP2_1_0_6_URL=http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz
BZIP2_1_0_6_SOURCE=$(LFS-SRC)/bzip2-1.0.6.tar.gz

define BZIP2_1_0_6_SOURCE_CMDS  
	@echo "BZIP2_1_0_6_TARGET_SOURCE"
endef

define BZIP2_1_0_6_CONFIGURE_CMDS
	@echo "BZIP2_1_0_6_CONFIGURE_CMDS"
	cd $(BZIP2_1_0_6_DIR); \
	patch -Np1 -i ../bzip2-1.0.6-install_docs-1.patch; \
	sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile; \
	sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile; \
	make -f Makefile-libbz2_so; \
	make clean
endef

define BZIP2_1_0_6_BUILD_CMDS
	make -C $(BZIP2_1_0_6_DIR)
endef

define BZIP2_1_0_6_INSTALL_TARGET_CMDS
	cd $(BZIP2_1_0_6_DIR); \
	make PREFIX=/tools install; \
	cp -v bzip2-shared /bin/bzip2; \
	cp -av libbz2.so* /lib; \
	ln -sv ../../lib/libbz2.so.1.0 /usr/lib/libbz2.so; \
	rm -v /usr/bin/{bunzip2,bzcat,bzip2}; \
	ln -sv bzip2 /bin/bunzip2; \
	ln -sv bzip2 /bin/bzcat;
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))