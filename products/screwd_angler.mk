# Copyright (C) 2015 Screw'd AOSP
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

# Check for target product

ifeq (screwd_angler,$(TARGET_PRODUCT))

# Include Screw'd common configuration
include vendor/screwd/main.mk

# Inherit AOSP device configuration for angler
$(call inherit-product, device/huawei/angler/aosp_angler.mk)

# Override AOSP build properties
PRODUCT_NAME := screwd_angler
PRODUCT_BRAND := google
PRODUCT_DEVICE := angler
PRODUCT_MODEL := Nexus 6P
PRODUCT_MANUFACTURER := Huawei

endif

# Device Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=angler \
    BUILD_FINGERPRINT=google/angler/angler:6.0.1/MHC19Q/2705526:user/release-keys \
    PRIVATE_BUILD_DESC="angler-user 6.0.1 MHC19Q 2705526 release-keys"


# Inline kernel building
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/aarch64/aarch64-$(TARGET_GCC_VERSION_KERNEL)/bin
KERNEL_TOOLCHAIN_PREFIX := aarch64-
TARGET_KERNEL_SOURCE := kernel/huawei/angler
TARGET_KERNEL_CONFIG := saber_defconfig
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

#Optimize-it!!
# System
export USE_CCACHE := 1
export USE_SYSTEM_CCACHE := 1

# Build
export ANDROID_COMPILE_WITH_JACK := false
export DISABLE_OPTIMIZATIONS := false
ifneq ($(DISABLE_OPTIMIZATIONS),true)
export DONT_ERROROUT := false
export USE_O3_OPTIMIZATIONS := false
export FORCE_DISABLE_DEBUGGING := true
export ENABLE_IPA_ANALYSER := true
export TARGET_USE_PIPE := true
export CORTEX_TUNINGS := true
export ENABLE_PTHREAD := true
export ENABLE_GOMP := true
export GRAPHITE_OPTS := true
export ENABLE_EXTRAGCC := true
export STRICT_ALIASING := true
export ENABLE_SANITIZE := true
endif

# Toolchain and other
export TARGET_NDK_GCC_VERSION := 4.9
export TARGET_GCC_VERSION_EXP := 4.9
export TARGET_GCC_VERSION := 4.9
export TARGET_GCC_VERSION_KERNEL := 7.0

# Prop Optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    debug.performance.tuning=1 \
    keyguard.no_require_sim=true \
    persist.service.lgospd.enable=0 \
    persist.service.pcsync.enable=0 \
    ro.facelock.black_timeout=400 \
    ro.facelock.det_timeout=1500 \
    ro.facelock.rec_timeout=2500 \
    ro.facelock.lively_timeout=2500 \
    ro.facelock.est_max_time=600 \
    ro.facelock.use_intro_anim=false \
    ro.ril.power_collapse=1 \
    ro.sys.fw.bg_apps_limit=20 \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1 \
    wifi.supplicant_scan_interval=180 \
    windowsmgr.max_events_per_sec=150

PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="David Smit (dsmitty166) & Dustin Rinne (f100cleveland)"
