################################################################################
#
# helix
#
################################################################################

HELIX_VERSION = 25.01.1
HELIX_SITE = $(call github,helix-editor,helix,$(HELIX_VERSION))
HELIX_LICENSE = MPL-2.0
HELIX_LICENSE_FILES = LICENSE

$(eval $(cargo-package))
