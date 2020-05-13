INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = danaus

danaus_FILES = Tweak.x
danaus_CFLAGS = -fobjc-arc

export TARGET = iphone:13.3:12.0
ARCHS = arm64 arm64e

include $(THEOS_MAKE_PATH)/tweak.mk
