TEXINFO_6_5_URL=http://ftp.gnu.org/gnu/texinfo/texinfo-6.5.tar.xz
TEXINFO_6_5_SOURCE=$(LFS-SRC)/texinfo-6.5.tar.xz

define TEXINFO_6_5_SOURCE_CMDS  
	@echo "TEXINFO_6_5_TARGET_SOURCE"
endef

define TEXINFO_6_5_CONFIGURE_CMDS
	cd $(TEXINFO_6_5_DIR); ./configure --prefix=/usr --disable-static
endef

define TEXINFO_6_5_BUILD_CMDS
	make -C $(TEXINFO_6_5_DIR)
endef

define TEXINFO_6_5_INSTALL_TARGET_CMDS
	cd $(TEXINFO_6_5_DIR); \
	[[ -z "$$LFSCHECK" ]] || make check; \
	make install; \
	make TEXMF=/usr/share/texmf install-tex; \
	pushd /usr/share/info; \
	rm -v dir; \
	for f in *; \
	do install-info $f dir 2>/dev/null; \
	done; \
	popd
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))