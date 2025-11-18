################################################################################
#
# kibi
#
################################################################################

KIBI_VERSION = 0.3.1
KIBI_SITE = $(call github,ilai-deutel,kibi,v$(KIBI_VERSION))
KIBI_LICENSE = MIT
KIBI_LICENSE_FILES = LICENSE-MIT

$(eval $(cargo-package))
