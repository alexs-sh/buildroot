################################################################################
#
# helix
#
################################################################################

HELIX_VERSION = e7ac2fcdecfdbf43a4f772e7f7c163b43b3d0b9b
HELIX_SITE = https://github.com/alexs-sh/helix.git
HELIX_SITE_METHOD = git
HELIX_LICENSE = MPL-2.0
HELIX_LICENSE_FILES = LICENSE
HELIX_DEPENDENCIES = host-pkgconf

$(eval $(cargo-package))
