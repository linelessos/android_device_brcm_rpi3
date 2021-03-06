#
# Copyright (C) 2020 The LineageOS Project
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

DEVICE_PATH := device/brcm/rpi3
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

$(call inherit-product, $(SRC_TARGET_DIR)/product/go_defaults_512.mk)
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
$(call inherit-product, vendor/brcm/rpi3/rpi3-vendor.mk)
$(call inherit-product-if-exists, vendor/konstakang/rpi3.mk)

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl

PRODUCT_PACKAGES += \
    gralloc.minigbm \
    hwcomposer.drm_minigbm \
    libGLES_mesa

# Ramdisk
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/ramdisk/fstab.rpi3:$(TARGET_COPY_OUT_RAMDISK)/fstab.rpi3 \
    $(DEVICE_PATH)/ramdisk/fstab.rpi3:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.rpi3 \
    $(DEVICE_PATH)/ramdisk/init.rpi3.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.rpi3.rc \
    $(DEVICE_PATH)/ramdisk/init.rpi3.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.rpi3.usb.rc \
    $(DEVICE_PATH)/ramdisk/ueventd.rpi3.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc

$(call inherit-product, device/brcm/rpi-common/device-common.mk)
