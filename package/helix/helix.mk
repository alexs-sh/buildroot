################################################################################
#
# helix
#
################################################################################

HELIX_VERSION = 25.01.1
HELIX_SITE = $(call github,helix-editor,helix,$(HELIX_VERSION))
HELIX_LICENSE = MPL-2.0
HELIX_LICENSE_FILES = LICENSE

HELIX_CARGO_ENV += \
        CRATE_CC_NO_DEFAULTS=1 \
        HOST_CC=$(HOSTCC) \
        HELIX_DISABLE_AUTO_GRAMMAR_BUILD=1

define HELIX_INSTALL_TARGET_CMDS
        $(INSTALL) -D -m 0755 $(@D)/target/$(RUSTC_TARGET_NAME)/release/hx $(TARGET_DIR)/bin/hx
endef

$(eval $(cargo-package))
