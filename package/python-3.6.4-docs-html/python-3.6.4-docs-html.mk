PYTHON_3_6_4_DOCS_HTML_URL=https://docs.python.org/ftp/python/doc/3.6.4/python-3.6.4-docs-html.tar.bz2
PYTHON_3_6_4_DOCS_HTML_SOURCE=$(LFS-SRC)/python-3.6.4-docs-html.tar.bz2

define PYTHON_3_6_4_DOCS_HTML_SOURCE_CMDS  
	@echo "PYTHON_3_6_4_DOCS_HTML_TARGET_SOURCE"
endef

define PYTHON_3_6_4_DOCS_HTML_CONFIGURE_CMDS
	cd $(PYTHON_3_6_4_DOCS_HTML_DIR); ./configure --prefix=/tools
endef

define PYTHON_3_6_4_DOCS_HTML_BUILD_CMDS
	make -C $(PYTHON_3_6_4_DOCS_HTML_DIR)
endef

define PYTHON_3_6_4_DOCS_HTML_INSTALL_TARGET_CMDS
	cd $(PYTHON_3_6_4_DOCS_HTML_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))