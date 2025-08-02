################################################################################
#
# aichat
#
################################################################################

AICHAT_VERSION = 0.30.0
AICHAT_SITE = $(call github,sigoden,aichat,v$(AICHAT_VERSION))
AICHAT_LICENSE = MIT
AICHAT_LICENSE_FILES = LICENSE-MIT

$(eval $(cargo-package))
