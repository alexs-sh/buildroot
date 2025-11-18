################################################################################
#
# kibi
#
################################################################################

KIBI_VERSION = 0.3.1
KIBI_SITE = $(call github,ilai-deutel,kibi,v$(KIBI_VERSION))
KIBI_LICENSE = MIT
KIBI_LICENSE_FILES = LICENSE-MIT

define KIBI_INSTALL_SYNTAX_HIGHLIGHTING_CMDS
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/kibi/syntax.d
	$(INSTALL) -m 0644 $(@D)/syntax.d/*.ini $(TARGET_DIR)/usr/share/kibi/syntax.d
endef

ifeq ($(BR2_PACKAGE_KIBI_SYNTAX_HIGHLIGHTING),y)
KIBI_POST_INSTALL_TARGET_HOOKS += KIBI_INSTALL_SYNTAX_HIGHLIGHTING_CMDS
endif

$(eval $(cargo-package))
