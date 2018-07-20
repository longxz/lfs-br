MESON_0_44_0_URL=https://github.com/mesonbuild/meson/releases/download/0.44.0/meson-0.44.0.tar.gz
MESON_0_44_0_SOURCE=$(LFS-SRC)/meson-0.44.0.tar.gz

define MESON_0_44_0_SOURCE_CMDS  
	@echo "MESON_0_44_0_TARGET_SOURCE"
endef

define MESON_0_44_0_CONFIGURE_CMDS
	cd $(MESON_0_44_0_DIR);
endef

define MESON_0_44_0_BUILD_CMDS
	cd $(MESON_0_44_0_DIR); \
	python3 setup.py build
endef

define MESON_0_44_0_INSTALL_TARGET_CMDS
	cd $(MESON_0_44_0_DIR); \
	python3 setup.py install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))