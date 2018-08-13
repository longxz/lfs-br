# Binutils-2.30 - Pass 1
BINUTILS_2_30_URL=http://ftp.gnu.org/gnu/binutils/binutils-2.30.tar.xz
BINUTILS_2_30_SOURCE=$(LFS-SRC)/binutils-2.30.tar.xz

define BINUTILS_2_30_SOURCE_CMDS  
	@echo "BINUTILS_2_30_TARGET_SOURCE"
endef

define BINUTILS_2_30_CONFIGURE_CMDS
	cd $(BINUTILS_2_30_DIR); \
	expect -c "spawn ls"; \
	mkdir -v build; \
	cd build; \
	../configure --prefix=/usr \
		--enable-gold \
		--enable-ld=default \
		--enable-plugins \
		--enable-shared \
		--disable-werror \
		--enable-64-bit-bfd \
		--with-system-zlib
endef

define BINUTILS_2_30_BUILD_CMDS
	cd $(BINUTILS_2_30_DIR); \
	cd build; \
	make tooldir=/usr
endef

define BINUTILS_2_30_INSTALL_TARGET_CMDS
	cd $(BINUTILS_2_30_DIR); \
	cd build; \
	[[ -z "$$LFSCHECK" ]] || make -k check; \
	make tooldir=/usr install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))
