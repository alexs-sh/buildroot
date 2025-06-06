################################################################################
#
# libftdi1
#
################################################################################

LIBFTDI1_VERSION = v1.5-48-g22b4667a8c3bc483494ba735ba4ae4d5cb8a0f03
LIBFTDI1_SITE = git://developer.intra2net.com/libftdi
LIBFTDI1_INSTALL_STAGING = YES
LIBFTDI1_DEPENDENCIES = host-pkgconf libusb
LIBFTDI1_LICENSE = LGPL-2.1 (libftdi1), MIT (libftdi1)
LIBFTDI1_LICENSE_FILES = LICENSE COPYING.LIB
LIBFTDI1_CONFIG_SCRIPTS = libftdi1-config
LIBFTDI1_CONF_OPTS = -DDOCUMENTATION=OFF -DEXAMPLES=OFF

ifeq ($(BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1),y)
LIBFTDI1_LICENSE += , GPL-2.0 with exception (libftdipp1)
LIBFTDI1_LICENSE_FILES += COPYING.GPL
LIBFTDI1_DEPENDENCIES += boost
LIBFTDI1_CONF_OPTS += -DFTDIPP=ON
else
LIBFTDI1_CONF_OPTS += -DFTDIPP=OFF
endif

ifeq ($(BR2_PACKAGE_LIBFTDI1_PYTHON_BINDINGS),y)
LIBFTDI1_DEPENDENCIES += python3 host-swig
LIBFTDI1_CONF_OPTS += -DPYTHON_BINDINGS=ON
else
LIBFTDI1_CONF_OPTS += -DPYTHON_BINDINGS=OFF
endif

ifeq ($(BR2_PACKAGE_LIBFTDI1_FDTI_EEPROM),y)
# ftdi_eeprom optionally depends on libintl
LIBFTDI1_LICENSE += , GPL-2.0 (ftdi_eeprom)
LIBFTDI1_LICENSE_FILES += COPYING.GPL
LIBFTDI1_DEPENDENCIES += libconfuse $(TARGET_NLS_DEPENDENCIES)
LIBFTDI1_CONF_OPTS += -DFTDI_EEPROM=ON
else
LIBFTDI1_CONF_OPTS += -DFTDI_EEPROM=OFF
endif

$(eval $(cmake-package))
