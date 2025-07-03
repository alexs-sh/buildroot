################################################################################
#
# uutils-coreutils
#
################################################################################

UUTILS_COREUTILS_VERSION = 0.1.0
UUTILS_COREUTILS_SITE = $(call github,uutils,coreutils,$(UUTILS_COREUTILS_VERSION))
UUTILS_COREUTILS_LICENSE = MIT
UUTILS_COREUTILS_LICENSE_FILES = LICENSE
UUTILS_COREUTILS_MAKE_ENV=PROJECT_NAME_FOR_VERSION_STRING="uutils coreutils"

ifeq ($(BR2_ENABLE_DEBUG),y)
UUTILS_COREUTILS_MAKE_ENV += PROFILE=debug
else
UUTILS_COREUTILS_MAKE_ENV += PROFILE=release
endif

ifeq ($(BR2_PACKAGE_UUTILS_COREUTILS_MULTICALL),y)
UUTILS_COREUTILS_MAKE_ENV += MULTICALL=y
else
UUTILS_COREUTILS_MAKE_ENV += MULTICALL=n
endif

define UUTILS_COREUTILS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

$(eval $(generic-package))
