################################################################################
#
# fish
#
################################################################################

FISH_VERSION = 67e86571097e6ac35a637344064aa6445f07da03
FISH_SITE = https://github.com/fish-shell/fish-shell.git
FISH_SITE_METHOD = git
FISH_LICENSE = GPL-2.0
FISH_LICENSE_FILES = LICENSE
FISH_CARGO_ENV=FISH_BUILD_VERSION=$(FISH_VERSION) FISH_BUILD_DOCS=0

$(eval $(cargo-package))
