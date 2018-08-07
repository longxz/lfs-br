GPERF_3_1_URL=http://ftp.gnu.org/gnu/gperf/gperf-3.1.tar.gz
GPERF_3_1_SOURCE=$(LFS-SRC)/gperf-3.1.tar.gz

define GPERF_3_1_SOURCE_CMDS  
	@echo "GPERF_3_1_TARGET_SOURCE"
endef

define GPERF_3_1_CONFIGURE_CMDS
	cd $(GPERF_3_1_DIR); ./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1
endef

define GPERF_3_1_BUILD_CMDS
	make -C $(GPERF_3_1_DIR)
endef

define GPERF_3_1_INSTALL_TARGET_CMDS
	cd $(GPERF_3_1_DIR); \
	[[ -z "$$LFSCHECK" ]] || make -j1 check; \
	make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))