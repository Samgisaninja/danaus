INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = danaus

danaus_FILES = Tweak.x
danaus_CFLAGS = -fobjc-arc
danaus_EXTRA_FRAMEWORKS += Cephei

ARCHS = armv7 arm64 arm64e

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += danausprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
