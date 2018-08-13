NINJA_1_8_2_URL=https://github.com/ninja-build/ninja/archive/v1.8.2/ninja-1.8.2.tar.gz
NINJA_1_8_2_SOURCE=$(LFS-SRC)/ninja-1.8.2.tar.gz

define NINJA_1_8_2_SOURCE_CMDS  
	@echo "NINJA_1_8_2_TARGET_SOURCE"
endef

define NINJA_1_8_2_CONFIGURE_CMDS
	cd $(NINJA_1_8_2_DIR); \
	patch -Np1 -i ../ninja-1.8.2-add_NINJAJOBS_var-1.patch; \
	python3 configure.py --bootstrap; \
	python3 configure.py; \
	./ninja ninja_test; \
	./ninja_test --gtest_filter=-SubprocessTest.SetWithLots
endef

define NINJA_1_8_2_BUILD_CMDS
	@echo "NINJA_1_8_2_BUILD_CMDS"
endef

define NINJA_1_8_2_INSTALL_TARGET_CMDS
	cd $(NINJA_1_8_2_DIR); \
	install -vm755 ninja /usr/bin/; \
	install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja; \
	install -vDm644 misc/zsh-completion /usr/share/zsh/site-functions/_ninja
endef

$(eval $(gen-pkg-name))
$(eval $(generic-package))