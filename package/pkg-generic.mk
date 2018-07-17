################################################################################
# Implicit targets -- produce a stamp file for each step of a package build
################################################################################

# Retrieve the archive
$(BUILD_DIR)/%/.stamp_downloaded:
	$(Q)mkdir -p $(@D)
	$($(PKG)_SOURCE_CMDS)
	$(Q)touch $@

# Unpack the archive
$(BUILD_DIR)/%/.stamp_extracted:
	$(Q)mkdir -p $(@D)
	$($(PKG)_EXTRACT_CMDS)
	$(Q)touch $@

# Configure
$(BUILD_DIR)/%/.stamp_configured:
	$($(PKG)_CONFIGURE_CMDS)
	$(Q)touch $@

# Build
$(BUILD_DIR)/%/.stamp_built:
	$($(PKG)_BUILD_CMDS)
	$(Q)touch $@

# Install to target dir
$(BUILD_DIR)/%/.stamp_target_installed:
	$($(PKG)_INSTALL_TARGET_CMDS)
	$(Q)touch $@

# Remove package sources
$(BUILD_DIR)/%/.stamp_dircleaned:
	rm -Rf $(@D)
	

################################################################################
# inner-generic-package -- generates the make targets needed to build a
# generic package
#
#  argument 1 is the lowercase package name
#  argument 2 is the uppercase package name
#
################################################################################

define inner-generic-package

# Ensure the package is only declared once, i.e. do not accept that a
# package be re-defined by a br2-external tree
ifneq ($(call strip,$(filter $(1),$(PACKAGES_ALL))),)
$$(error Package '$(1)' defined a second time in '$(pkgdir)'; \
	previous definition was in '$$($(2)_PKGDIR)')
endif
PACKAGES_ALL += $(1)
PACKAGES += $(1)

# Define default values for various package-related variables, if not
# already defined. For some variables (version, source, site and
# subdir), if they are undefined, we try to see if a variable without
# the HOST_ prefix is defined. If so, we use such a variable, so that
# this information has only to be specified once, for both the
# target and host packages of a given .mk file.

$(2)_PKGDIR			=  $(pkgdir)
$(2)_DIR			=  $$(BUILD_DIR)/$(1)

$(2)_STRIP_COMPONENTS ?= 1

# define sub-target stamps
$(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
$(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
$(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
$(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
$(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
$(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded

# default extract command
$(info $(2)_SOURCE)
$(2)_EXTRACT_CMDS ?= \
	tar xf $$($(2)_SOURCE) --strip-components=$$($(2)_STRIP_COMPONENTS) \
		-C $$($(2)_DIR)

$(2)_SOURCE_CMDS ?= \
	@echo "default $(2)_SOURCE_CMDS: do nothing"

$(2)_CONFIGURE_CMDS ?= \
	@echo "default $(2)_CONFIGURE_CMDS: do nothing"
	
$(2)_BUILD_CMDS ?= \
	@echo "default $(2)_BUILD_CMDS: do nothing"

$(2)_INSTALL_TARGET_CMDS ?= \
	@echo "default $(2)_INSTALL_TARGET_CMDS: do nothing"

# human-friendly targets and target sequencing
$(1):			$(1)-install

$(1)-install:		$(1)-install-target
$(1)-install-target:		$$($(2)_TARGET_INSTALL_TARGET)
$$($(2)_TARGET_INSTALL_TARGET):	$$($(2)_TARGET_BUILD)

$$($(2)_TARGET_BUILD):	$$($(2)_TARGET_CONFIGURE)

$$($(2)_TARGET_CONFIGURE):	$$($(2)_TARGET_EXTRACT)

$$($(2)_TARGET_EXTRACT):	$$($(2)_TARGET_SOURCE)

$(1)-build:			$$($(2)_TARGET_BUILD)
$(1)-configure:		$$($(2)_TARGET_CONFIGURE)
$(1)-extract:		$$($(2)_TARGET_EXTRACT)
$(1)-source:		$$($(2)_TARGET_SOURCE)
$(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)




# define the PKG variable for all targets, containing the
# uppercase package variable prefix
$$($(2)_TARGET_BUILD):			PKG=$(2)
$$($(2)_TARGET_CONFIGURE):		PKG=$(2)
$$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
$$($(2)_TARGET_EXTRACT):		PKG=$(2)
$$($(2)_TARGET_INSTALL):		PKG=$(2)
$$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
$$($(2)_TARGET_SOURCE):			PKGDIR=$(pkgdir)

# Ensure all virtual targets are PHONY. Listed alphabetically.
.PHONY:	$(1) \
	$(1)-build \
	$(1)-configure \
	$(1)-dirclean \
	$(1)-extract \
	$(1)-install \
	$(1)-install-target \
	$(1)-source 

endef # inner-generic-package

generic-package = $(call inner-generic-package,$(pkgname),$(call UPPERCASE,$(pkgname)))
