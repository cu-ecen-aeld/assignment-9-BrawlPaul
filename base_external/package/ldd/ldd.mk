
##############################################################
#
# LDD
#
##############################################################

LDD_VERSION = 58e8d85450032c47123c98b1e858ff77e605c1ea
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-BrawlPaul.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

define LDD_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) ARCH=arm64 CROSS_COMPILE=$(TARGET_CROSS) KERNELDIR=$(LINUX_DIR) -C $(@D)/misc-modules modules
	$(MAKE) $(TARGET_CONFIGURE_OPTS) ARCH=arm64 CROSS_COMPILE=$(TARGET_CROSS) KERNELDIR=$(LINUX_DIR) -C $(@D)/scull modules

endef

define LDD_INSTALL_TARGET_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILE=$(TARGET_CROSS) -C $(LINUX_DIR) M=$(@D)/misc-modules modules_install INSTALL_MOD_PATH=$(TARGET_DIR)
	$(MAKE) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILE=$(TARGET_CROSS) -C $(LINUX_DIR) M=$(@D)/scull modules_install INSTALL_MOD_PATH=$(TARGET_DIR)
	
endef

$(eval $(generic-package))
