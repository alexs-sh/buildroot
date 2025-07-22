################################################################################
#
# helix
#
################################################################################

HELIX_VERSION = 25.07.1
HELIX_SITE = $(call github,helix-editor,helix,$(HELIX_VERSION))
HELIX_LICENSE = MPL-2.0
HELIX_LICENSE_FILES = LICENSE

HELIX_CARGO_ENV += HOST_CC=$(HOSTCC) \
	HELIX_DISABLE_AUTO_GRAMMAR_BUILD=1

HELIX_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),debug,release)

define HELIX_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/target/$(RUSTC_TARGET_NAME)/$(HELIX_BUILD_TYPE)/hx $(TARGET_DIR)/usr/bin/hx
endef

$(eval $(cargo-package))
