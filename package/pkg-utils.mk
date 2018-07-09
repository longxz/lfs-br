define gen-pkg-name
	pkgdir = $(dir $(lastword $(MAKEFILE_LIST)))
	pkgname =  $(lastword $(strip $(subst /, ,$(dir $(lastword $(MAKEFILE_LIST))))))
endef
