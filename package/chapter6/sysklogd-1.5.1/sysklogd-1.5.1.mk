SYSKLOGD_1_5_1_URL=http://www.infodrom.org/projects/sysklogd/download/sysklogd-1.5.1.tar.gz
SYSKLOGD_1_5_1_SOURCE=$(LFS-SRC)/sysklogd-1.5.1.tar.gz

define SYSKLOGD_1_5_1_SOURCE_CMDS  
	@echo "SYSKLOGD_1_5_1_TARGET_SOURCE"
endef

define SYSKLOGD_1_5_1_CONFIGURE_CMDS
	cd $(SYSKLOGD_1_5_1_DIR); \
	sed -i '/Error loading kernel symbols/{n;n;d}' ksym_mod.c; \
	sed -i 's/union wait/int/' syslogd.c; \
endef

define SYSKLOGD_1_5_1_BUILD_CMDS
	make -C $(SYSKLOGD_1_5_1_DIR)
endef

define SYSKLOGD_1_5_1_INSTALL_TARGET_CMDS
	cd $(SYSKLOGD_1_5_1_DIR); \
	make BINDIR=/sbin install; \

	# Configuring Sysklogd
	echo '# Begin /etc/syslog.conf\n \
		auth,authpriv.* -/var/log/auth.log\n \
		*.*;auth,authpriv.none -/var/log/sys.log\n \
		daemon.* -/var/log/daemon.log\nkern.* -/var/log/kern.log\n \
		mail.* -/var/log/mail.log\nuser.* \
		-/var/log/user.log\n*.emerg *\n\n \
		# End /etc/syslog.conf' > /etc/syslog.conf
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))