# Copyright (C) 2007 The Android Open Source Project
# Copyright (C) 2012 Dāvis Mālnieks (TheWhisp)
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

# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

LOCAL_PATH:= $(call my-dir)

TARGET_GLOBAL_CFLAGS += -mfpu=vfp -mfloat-abi=softfp -Os
TARGET_GLOBAL_CPPFLAGS += -mfpu=vfp -mfloat-abi=softfp -Os

USE_CAMERA_STUB := false

## Kernel
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := tass
BOARD_KERNEL_BASE := 0x13600000
BOARD_KERNEL_PAGESIZE := 4096
TARGET_KERNEL_SOURCE := kernel/samsung/tass
TARGET_KERNEL_CONFIG := cyanogenmod_tass_defconfig

## Platform
TARGET_BOARD_PLATFORM := msm7x27
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_SPECIFIC_HEADER_PATH := device/samsung/tass/include

## Webkit, browser
JS_ENGINE := v8
HTTP := chrome
ENABLE_WEBGL := true
TARGET_WEBKIT_USE_MORE_MEMORY := true

## JIT
WITH_JIT := true
ENABLE_JSC_JIT := true

## Qualcomm, display
BOARD_USES_QCOM_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DREFRESH_RATE=56 -DQCOM_ICS_COMPAT -DICS_CAMERA_BLOB -DFORCE_CPU_UPLOAD -DQCOM_NO_SECURE_PLAYBACK
BOARD_NEEDS_MEMORYHEAPPMEM := true
USE_OPENGL_RENDERER := true
TARGET_USES_GENLOCK := true
TARGET_FORCE_CPU_UPLOAD := true
BOARD_EGL_CFG := device/samsung/tass/prebuilt/lib/egl/egl.cfg

## GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := tass
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 1240

## Other Qualcomm config
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_AUDIO_SPEECH := true

## Assert
TARGET_OTA_ASSERT_DEVICE := tass,GT-S5570

## Bluetooth
BOARD_HAVE_SAMSUNG_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

## FM
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
BOARD_FM_DEVICE := brcm2049

## Wi-Fi
BOARD_WPA_SUPPLICANT_DRIVER := AR6000
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := wlan0
WIFI_DRIVER_MODULE_PATH     := /system/wifi/ar6000.ko
WIFI_DRIVER_MODULE_NAME     := ar6000

## RIL
BOARD_FORCE_RILD_AS_ROOT := true
BOARD_MOBILEDATA_INTERFACE_NAME := "pdp0"

## UMS
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file
BOARD_UMS_LUNFILE := "/sys/devices/platform/usb_mass_storage/lun0/file"

## Audio
TARGET_PROVIDES_LIBAUDIO := true

## Touchscreen
BOARD_USE_LEGACY_TOUCHSCREEN := true

## Recovery
BOARD_USE_SKIA_LCDTEXT := true
BOARD_LDPI_RECOVERY := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 229938816 # default: 219938816
BOARD_USERDATAIMAGE_PARTITION_SIZE := 190054400
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_KERNEL_CMDLINE := 
BOARD_BML_BOOT := "/dev/block/bml8"
BOARD_BML_RECOVERY := "/dev/block/bml9"
BOARD_RECOVERY_HANDLES_MOUNT := true
BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/tass/recovery/graphics.c
TARGET_RECOVERY_INITRC := device/samsung/tass/prebuilt/recovery.rc
