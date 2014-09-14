# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Release name
PRODUCT_RELEASE_NAME := p880

# Inherit common product files.
$(call inherit-product, vendor/mahdi/config/common.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/mahdi/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lge/p880/p880.mk)

# Mahdi packages
PRODUCT_PACKAGES += OmniSwitch

# Copy device specific prebuilt files.
PRODUCT_COPY_FILES += \
    vendor/mahdi/prebuilt/bootanimations/BOOTANIMATION-1280x768.zip:system/media/bootanimation.zip

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := p880
PRODUCT_NAME := mahdi_p880
PRODUCT_BRAND := LG
PRODUCT_MODEL := Optimus 4X HD
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=x3 BUILD_FINGERPRINT="lge/x3/p880:4.4.3/KTU84L/1148727:user/release-keys" PRIVATE_BUILD_DESC="x3-user 4.4.3 KTU84L 1148727 release-keys"
