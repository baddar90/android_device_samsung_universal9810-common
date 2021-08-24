#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 29

# Screen density
# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := xlarge
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi
# A list of dpis to select prebuilt apk, in precedence order.
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Boot animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_SCREEN_HEIGHT := 2960
TARGET_SCREEN_WIDTH := 1440

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-hotword.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.sensor.heartrate.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.heartrate.xml \
    frameworks/native/data/etc/android.hardware.vr.high_performance.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.vr.high_performance.xml \
    frameworks/native/data/etc/android.software.controls.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.controls.xml

# Rootdir
PRODUCT_PACKAGES += \
    fstab.samsungexynos9810 \
    init.samsung.rc \
    init.usb_accessory.rc

# Recovery
PRODUCT_PACKAGES += \
    init.recovery.samsungexynos9810.rc

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/etc/audio_policy_configuration.xml

# SP-NDK
PRODUCT_PACKAGES += \
    libvulkan

# Bluetooth
PRODUCT_PACKAGES += \
    audio.a2dp.default

# Camera
PRODUCT_PACKAGES += \
    Snap

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci \
    Tag

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/libnfc-nci.conf:$(TARGET_COPY_OUT_PRODUCT)/etc/libnfc-nci.conf

# LiveDisplay
PRODUCT_PACKAGES += \
    lineage.livedisplay@2.0-service.9810

# Touch
PRODUCT_PACKAGES += \
    lineage.touch@1.0-service.9810

# FastCharge
PRODUCT_PACKAGES += \
    lineage.fastcharge@1.0-service.9810

# Light
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.9810

# Vibrator
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/hidl/vibrator/vendor.samsung.hardware.vibrator@2.1-service:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/bin/hw/vendor.samsung.hardware.vibrator@2.1-service \
    $(LOCAL_PATH)/hidl/vibrator/vendor.samsung.hardware.vibrator@2.1-service.rc:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/etc/init/vendor.samsung.hardware.vibrator@2.1-service.rc

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/hidl/sensors/lib/android.hardware.sensors@1.0-impl.so:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/lib/hw/android.hardware.sensors@1.0-impl.so \
    $(LOCAL_PATH)/hidl/sensors/lib64/android.hardware.sensors@1.0-impl.so:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/lib64/hw/android.hardware.sensors@1.0-impl.so

# Power
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/hidl/power/android.hardware.power@1.0-service.rc:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/etc/init/android.hardware.power@1.0-service.rc \
    $(LOCAL_PATH)/hidl/power/android.hardware.power@1.3-service.samsung.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/etc/vintf/manifest/android.hardware.power@1.3-service.samsung.xml \
    $(LOCAL_PATH)/hidl/power/android.hardware.power@1.3-service.samsung-libperfmgr:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/bin/hw/android.hardware.power@1.3-service.samsung-libperfmgr \
    $(LOCAL_PATH)/hidl/power/libperfmgr.so:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/lib64/libperfmgr.so \
    $(LOCAL_PATH)/hidl/power/powerhint.json:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/etc/powerhint.json

# Ringtones
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/audio/ringtones/Xylophone_Dubstep.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Xylophone_Dubstep.ogg

# S-Pen
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/samsung-sec_e-pen.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/sec_e-pen.idc

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio_keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio_keys.kl

# liboemcrypto.so
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/null:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/lib/liboemcrypto.so

# Soong
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# Property overrides
-include $(LOCAL_PATH)/product_prop.mk
-include $(LOCAL_PATH)/system_prop.mk

# Call proprietary blob setup
$(call inherit-product, vendor/samsung/universal9810-common/universal9810-common-vendor.mk)
