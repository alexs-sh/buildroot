################################################################################
#
# helix
#
################################################################################

HELIX_VERSION = 25.07.1
HELIX_SITE = $(call github,helix-editor,helix,$(HELIX_VERSION))
HELIX_LICENSE = MPL-2.0
HELIX_LICENSE_FILES = LICENSE
HELIX_CARGO_ENV += HOST_CC=$(HOSTCC)
HELIX_BUILD_TYPE = $(if $(BR2_ENABLE_DEBUG),debug,release)
HELIX_RUNTIME_DIR = usr/share/helix/runtime

# NOTE: Building grammars is currently unstable and will most likely lead to
# a broken build. Use with caution.
ifeq ($(BR2_PACKAGE_HELIX_INSTALL_GRAMMARS),y)
HELIX_CARGO_ENV += CRATE_CC_NO_DEFAULTS=1 TARGET=$(TARGET_CROSS)
else
HELIX_CARGO_ENV += HELIX_DISABLE_AUTO_GRAMMAR_BUILD=1
endif

# Install themes
define HELIX_INSTALL_THEMES_CMDS
	$(INSTALL) -d -m 755 $(TARGET_DIR)/$(HELIX_RUNTIME_DIR)/themes/
	$(INSTALL) -D -m 0644 $(@D)/runtime/themes/*.toml $(TARGET_DIR)/$(HELIX_RUNTIME_DIR)/themes
endef

# If themes are enabled, two things should be done:
# - HELIX_DEFAULT_RUNTIME must be provided to Cargo
# - Themes must be installed to HELIX_DEFAULT_RUNTIME
ifeq ($(BR2_PACKAGE_HELIX_INSTALL_THEMES),y)
HELIX_CARGO_ENV += HELIX_DEFAULT_RUNTIME=/$(HELIX_RUNTIME_DIR)
HELIX_POST_INSTALL_TARGET_HOOKS += HELIX_INSTALL_THEMES_CMDS
endif

# Install Helix binary
define HELIX_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/target/$(RUSTC_TARGET_NAME)/$(HELIX_BUILD_TYPE)/hx $(TARGET_DIR)/usr/bin/hx
endef

$(eval $(cargo-package))
