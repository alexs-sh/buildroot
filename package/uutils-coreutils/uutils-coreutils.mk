################################################################################
#
# uutils-coreutils
#
################################################################################

UUTILS_COREUTILS_VERSION = 0.1.0
UUTILS_COREUTILS_SITE = $(call github,uutils,coreutils,$(UUTILS_COREUTILS_VERSION))
UUTILS_COREUTILS_LICENSE = MIT
UUTILS_COREUTILS_LICENSE_FILES = LICENSE
UUTILS_COREUTILS_CARGO_ENV=PROJECT_NAME_FOR_VERSION_STRING="uutils coreutils"

# The list of supported utilities is used to instruct Cargo on which package(s)
# to build when coreutils is built as a set of separate files. It is also
# required to install the files into a target directory.
PROGS = $(shell cd $(@D) && sed -n '/feat_common_core =/,/]/p' Cargo.toml | grep -o '".*"' | tr -d '"')

ifeq ($(BR2_ENABLE_DEBUG),y)
UUTILS_COREUTILS_PROFILE=debug
else
UUTILS_COREUTILS_PROFILE=release
endif

ifeq ($(BR2_PACKAGE_UUTILS_COREUTILS_MULTICALL),y)
define UUTILS_COREUTILS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/target/$(RUSTC_TARGET_NAME)/$(UUTILS_COREUTILS_PROFILE)/coreutils $(TARGET_DIR)/bin/
endef
else
UUTILS_COREUTILS_CARGO_BUILD_OPTS += $(foreach prog,$(PROGS),-p uu_$(prog))
define UUTILS_COREUTILS_INSTALL_TARGET_CMDS
	$(foreach prog,$(PROGS), \
		$(INSTALL) -D -m 0755 $(@D)/target/$(RUSTC_TARGET_NAME)/$(UUTILS_COREUTILS_PROFILE)/$(prog) $(TARGET_DIR)/bin/
	)
endef
endif

$(eval $(cargo-package))
