# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Release name
PRODUCT_RELEASE_NAME := p880

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# This device has NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/lge/p880/p880.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := p880
PRODUCT_NAME := cm_p880
PRODUCT_BRAND := LG
PRODUCT_MODEL := Optimus 4X HD
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=x3 BUILD_FINGERPRINT="lge/x3/p880:4.4.3/KTU84L/1148727:user/release-keys" PRIVATE_BUILD_DESC="x3-user 4.4.3 KTU84L 1148727 release-keys"
