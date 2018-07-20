BASH_4_4_18_URL=http://ftp.gnu.org/gnu/bash/bash-4.4.18.tar.gz
BASH_4_4_18_SOURCE=$(LFS-SRC)/bash-4.4.18.tar.gz

define BASH_4_4_18_SOURCE_CMDS  
	@echo "BASH_4_4_18_TARGET_SOURCE"
endef

define BASH_4_4_18_CONFIGURE_CMDS
	cd $(BASH_4_4_18_DIR); \
	./configure --prefix=/usr \
		--docdir=/usr/share/doc/bash-4.4.18 \
		--without-bash-malloc \
		--with-installed-readline
endef

define BASH_4_4_18_BUILD_CMDS
	make -C $(BASH_4_4_18_DIR)
endef

define BASH_4_4_18_INSTALL_TARGET_CMDS
	cd $(BASH_4_4_18_DIR); \
	chown -Rv nobody .; \
	su nobody -s /bin/bash -c "PATH=$PATH make tests"; \
	make install; \
	mv -vf /usr/bin/bash /bin; \
	exec /bin/bash --login +h
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))