include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = danausprefs

danausprefs_FILES = DAPRootListController.m
danausprefs_INSTALL_PATH = /Library/PreferenceBundles
danausprefs_FRAMEWORKS = UIKit
danausprefs_PRIVATE_FRAMEWORKS = Preferences
danausprefs_CFLAGS = -fobjc-arc

ARCHS = armv7 arm64 arm64e

include $(THEOS_MAKE_PATH)/bundle.mk


internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/danausprefs.plist$(ECHO_END)
