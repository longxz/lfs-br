# declare before package include scripts/generic-package.mk

LFS-SRC=/mnt/lfs/sources
BUILD_DIR=$(LFS-SRC)/build_dir

PACKAGES :=
PACKAGES_ALL :=

CHARPTER=5

include scripts/utils.mk

include package/pkg-utils.mk
include package/pkg-generic.mk

ifeq ($(CHARPTER),5)
include package/binutils-2.30/binutils-2.30.mk
include package/m4-1.4.18/m4-1.4.18.mk
endif

ifeq ($(CHARPTER),6)
include package/glibc-2.27/glibc-2.27.mk
endif

.PHONY: target-finalize
target-finalize: $(PACKAGES)

.PHONY: prepare
prepare:

.PHONY: world
world: prepare target-finalize
	@echo "make world"

.PHONY: all
all: world
	@echo "make all"

