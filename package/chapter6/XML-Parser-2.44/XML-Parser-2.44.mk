XML_PARSER_2_44_URL=http://cpan.metacpan.org/authors/id/T/TO/TODDR/XML-Parser-2.44.tar.gz
XML_PARSER_2_44_SOURCE=$(LFS-SRC)/XML-Parser-2.44.tar.gz

define XML_PARSER_2_44_SOURCE_CMDS  
	@echo "XML_PARSER_2_44_TARGET_SOURCE"
endef

define XML_PARSER_2_44_CONFIGURE_CMDS
	cd $(XML_PARSER_2_44_DIR); ./configure --prefix=/tools
endef

define XML_PARSER_2_44_BUILD_CMDS
	make -C $(XML_PARSER_2_44_DIR)
endef

define XML_PARSER_2_44_INSTALL_TARGET_CMDS
	cd $(XML_PARSER_2_44_DIR); make install
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))