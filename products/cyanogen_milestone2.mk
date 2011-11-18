# Inherit AOSP device configuration.
$(call inherit-product, device/motorola/milestone2/milestone2.mk)

# Inherit common GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_milestone2
PRODUCT_BRAND := MOTO
PRODUCT_DEVICE := milestone2
PRODUCT_MODEL := A953
PRODUCT_MANUFACTURER := motorola
PRODUCT_SBF := 2.4.24
PRODUCT_SFX := MILS2_U6

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%y%m%d-%H%M)-NIGHTLY-Milestone2
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-milestone2
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-milestone2
    endif
endif

UTC_DATE := $(shell date +%s)
DATE     := $(shell date +%Y%m%d)

PRODUCT_BUILD_PROP_OVERRIDES := \
BUILD_ID=MILS2_U6_2.4.24 \
BUILD_DISPLAY_ID="MILS2_U6_2.4.24" \
PRODUCT_NAME=${PRODUCT_MODEL}_${PRODUCT_SFX} \
TARGET_DEVICE=milestone2 \
BUILD_FINGERPRINT=MOTO/RTGB/umts_milestone2/A953:2.2.2/MILS2_U6_2.4.24/8481072:user/ota-rel-keys,release-keys \
PRODUCT_BRAND=MOTO \
PRIVATE_BUILD_DESC="umts_milestone2-user 2.2.2 MILS2_U6_2.4.24 8481072 ota-rel-keys,release-keys" \
BUILD_NUMBER=${DATE} \
BUILD_VERSION_TAGS=release-keys \
TARGET_BUILD_TYPE=user \
USER=a17935


PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip

PRODUCT_PACKAGE_OVERLAYS += \
    vendor/cyanogen/overlay/milestone2

# Add the Torch app
PRODUCT_PACKAGES += \
    Torch

