ARCHS = arm64
TARGET := iphone:clang:latest:13.0
INSTALL_TARGET_PROCESSES = SAOL14

ifdef JAILED
MODULES = jailed
PACKAGE_FORMAT=ipa-jailed
endif

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DarkSAOL

$(TWEAK_NAME)_FILES = $(wildcard *.x)
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

BUNDLE_ID = com.henrikssonbrothers.darksaol
$(TWEAK_NAME)_IPA = saol-app/SAOL14.app

include $(THEOS_MAKE_PATH)/tweak.mk
