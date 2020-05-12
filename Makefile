INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = danaus

danaus_FILES = Tweak.x
danaus_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
