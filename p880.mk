$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

#Misc buid.prop tweaks
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.hsxpa=2 \
    ro.ril.gprsclass=10 \
    
$(call inherit-product-if-exists, vendor/lge/p880/p880-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/p880/overlay

PRODUCT_TAGS += dalvik.gc.type-precise
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# This device is xhdpi
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

LOCAL_PATH := device/lge/p880

## Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
    $(LOCAL_PATH)/prebuilt/recovery.sh:system/bin/setup-recovery

## Boot image
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.x3.rc:root/init.x3.rc \
    $(LOCAL_PATH)/init.x3.usb.rc:root/init.x3.usb.rc \
    $(LOCAL_PATH)/ueventd.x3.rc:root/ueventd.x3.rc \
    $(LOCAL_PATH)/fstab.x3:root/fstab.x3

## Miscellaneous configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/ipc_channels.config:system/etc/ipc_channels.config \
    $(LOCAL_PATH)/configs/nfcee_access.xml:system/etc/nfcee_access.xml \
    $(LOCAL_PATH)/configs/bcmdhd.cal:system/etc/wifi/bcmdhd.cal

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/nvcamera.conf:system/etc/nvcamera.conf

## GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/lge.cer:system/etc/cert/lge.cer \
    $(LOCAL_PATH)/configs/hmconfig.txt:system/etc/hmconfig.txt \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/SuplRootCert:system/etc/SuplRootCert

## Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/MHLRCP.kl:system/usr/keylayout/MHLRCP.kl \
    $(LOCAL_PATH)/configs/tegra-snd-max98088.kl:system/usr/keylayout/tegra-snd-max98088.kl \
    $(LOCAL_PATH)/configs/touch_dev.kl:system/usr/keylayout/touch_dev.kl \
    $(LOCAL_PATH)/configs/touch_dev.idc:system/usr/idc/touch_dev.idc

## ALSA Config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/nvaudio_conf.xml:system/etc/nvaudio_conf.xml 

$(call inherit-product, build/target/product/full.mk)

# Permission files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nvcpud.xml::system/etc/permissions/nvcpud.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

# Charger mode
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    com.android.future.usb.accessory \
    lights.x3 \
    Torch \
    auditd

# NFC packages
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag

# For SELinux
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/51selinux:system/etc/init.d/51selinux

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

$(call inherit-product, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
