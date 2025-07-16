################################################################################
#
# nnn
#
################################################################################

NNN_VERSION = v5.1
NNN_LICENSE = BSD-2-Clause
NNN_LICENSE_FILES = LICENSE
NNN_SITE = $(call github,jarun,nnn,$(NNN_VERSION))
NNN_DEPENDENCIES = readline ncurses host-pkgconf
NNN_INSTALL_STAGING = YES
NNN_BIN = /usr/bin/nnn

define NNN_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
	CC="$(TARGET_CC)" CCFLAGS="$(TARGET_CFLAGS)"
endef

# Install the binaries, manuals, and other items described in the Makefile to the staging directory
define NNN_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
	DESTDIR=$(STAGING_DIR) PREFIX=/usr MANPREFIX=/usr/local install
endef

# Put a stripped binary into the target directory
define NNN_INSTALL_TARGET_CMDS
	cp -f $(STAGING_DIR)/$(NNN_BIN) $(TARGET_DIR)/$(NNN_BIN)
	$(TARGET_STRIP) $(TARGET_DIR)/$(NNN_BIN)
endef

$(eval $(generic-package))
