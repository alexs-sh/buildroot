################################################################################
#
# imx-caam-keygen
#
################################################################################

IMX_CAAM_KEYGEN_KERNEL_VERSION = 5.15.71
IMX_CAAM_KEYGEN_VERSION = 2.2.2
IMX_CAAM_KEYGEN_SITE = $(call github,nxp-imx,keyctl_caam,lf-$(IMX_CAAM_KEYGEN_KERNEL_VERSION)-$(IMX_CAAM_KEYGEN_VERSION))
IMX_CAAM_KEYGEN_LICENSE = BSD-3-Clause
IMX_CAAM_KEYGEN_LICENSE_FILES = COPYING
IMX_CAAM_KEYGEN_MAKE_OPTS = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS)

define IMX_CAAM_KEYGEN_BUILD_CMDS
	$(MAKE) -C $(@D) $(IMX_CAAM_KEYGEN_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all
endef

define IMX_CAAM_KEYGEN_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D) $(IMX_CAAM_KEYGEN_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
endef

$(eval $(generic-package))
