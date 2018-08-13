SHADOW_4_5_URL=https://github.com/shadow-maint/shadow/releases/download/4.5/shadow-4.5.tar.xz
SHADOW_4_5_SOURCE=$(LFS-SRC)/shadow-4.5.tar.xz

define SHADOW_4_5_SOURCE_CMDS  
	@echo "SHADOW_4_5_TARGET_SOURCE"
endef

define SHADOW_4_5_CONFIGURE_CMDS
	cd $(SHADOW_4_5_DIR); \
	sed -i 's/groups$$(EXEEXT) //' src/Makefile.in; \
	find man -name Makefile.in -exec sed -i 's/groups\.1 / /' {} \; \
	find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \; \
	find man -name Makefile.in -exec sed -i 's/passwd\.5 / /' {} \; \
	sed -i -e 's@#ENCRYPT_METHOD DES@ENCRYPT_METHOD SHA512@' \
		-e 's@/var/spool/mail@/var/mail@' etc/login.defs; \
	sed -i 's/1000/999/' etc/useradd; \
	./configure --sysconfdir=/etc --with-group-name-max-length=32
endef

define SHADOW_4_5_BUILD_CMDS
	make -C $(SHADOW_4_5_DIR)
endef

define SHADOW_4_5_INSTALL_TARGET_CMDS
	cd $(SHADOW_4_5_DIR); \
	make install; \
	mv -v /usr/bin/passwd /bin

	# Configuring Shadow
	cd $(SHADOW_4_5_DIR); \
	pwconv; \
	grpconv; \
	sed -i 's/yes/no/' /etc/default/useradd; \

	# Setting the root password
	passwd root
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))