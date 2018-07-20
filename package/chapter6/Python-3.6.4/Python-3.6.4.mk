PYTHON_3_6_4_URL=https://www.python.org/ftp/python/3.6.4/Python-3.6.4.tar.xz
PYTHON_3_6_4_SOURCE=$(LFS-SRC)/Python-3.6.4.tar.xz

define PYTHON_3_6_4_SOURCE_CMDS  
	@echo "PYTHON_3_6_4_TARGET_SOURCE"
endef

define PYTHON_3_6_4_CONFIGURE_CMDS
	cd $(PYTHON_3_6_4_DIR); \
	./configure --prefix=/usr \
		--enable-shared \
		--with-system-expat \
		--with-system-ffi \
		--with-ensurepip=yes
endef

define PYTHON_3_6_4_BUILD_CMDS
	make -C $(PYTHON_3_6_4_DIR)
endef

define PYTHON_3_6_4_INSTALL_TARGET_CMDS
	cd $(PYTHON_3_6_4_DIR); \
	make install; \
	chmod -v 755 /usr/lib/libpython3.6m.so; \
	chmod -v 755 /usr/lib/libpython3.so; \
	install -v -dm755 /usr/share/doc/python-3.6.4/html; \
	tar --strip-components=1 \
		--no-same-owner \
		--no-same-permissions \
		-C /usr/share/doc/python-3.6.4/html \
		-xvf ../python-3.6.4-docs-html.tar.bz2
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))