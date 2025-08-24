################################################################################
#
# nnn
#
################################################################################

NNN_VERSION = 5.1
NNN_LICENSE = BSD-2-Clause
NNN_LICENSE_FILES = LICENSE
NNN_SITE = $(call github,jarun,nnn,v$(NNN_VERSION))
NNN_DEPENDENCIES = ncurses
NNN_MAKE_FLAGS = CFLAGS_OPTIMIZATION=

# "readline" is an optional dependency. If the package is enabled,
# add it to the dependencies list. Otherwise, build the "norl" target.
ifeq ($(BR2_PACKAGE_READLINE),y)
NNN_DEPENDENCIES += readline
else
NNN_MAKE_FLAGS += norl
endif

define NNN_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
	-C $(@D) $(NNN_MAKE_FLAGS)
endef

define NNN_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
	-C $(@D) $(NNN_MAKE_FLAGS) \
	DESTDIR=$(TARGET_DIR) PREFIX=/usr install
endef

$(eval $(generic-package))
