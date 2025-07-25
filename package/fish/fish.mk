################################################################################
#
# fish
#
################################################################################

FISH_VERSION = 4.0.2
FISH_SITE = $(call github,fish-shell,fish-shell,$(FISH_VERSION))
FISH_LICENSE = GPL-2.0
FISH_LICENSE_FILES = LICENSE
FISH_CARGO_ENV=FISH_BUILD_VERSION=$(FISH_VERSION) FISH_BUILD_DOCS=0

$(eval $(cargo-package))
