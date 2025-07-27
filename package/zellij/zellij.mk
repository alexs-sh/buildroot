################################################################################
#
# zellij
#
################################################################################

ZELLIJ_VERSION = v0.42.2
ZELLIJ_SITE = $(call github,zellij-org,zellij,$(ZELLIJ_VERSION))
ZELLIJ_LICENSE = MIT
ZELLIJ_LICENSE_FILES = LICENSE

$(eval $(cargo-package))
