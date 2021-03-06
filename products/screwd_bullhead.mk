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

ifeq (screwd_bullhead,$(TARGET_PRODUCT))

# Include Screw'd common configuration
include vendor/screwd/main.mk
include vendor/screwd/configs/screwd_opts.mk

# Inherit AOSP device configuration for bullhead
$(call inherit-product, device/lge/bullhead/aosp_bullhead.mk)

# Override AOSP build properties
PRODUCT_NAME := screwd_bullhead
PRODUCT_DEVICE := bullhead
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 5X
PRODUCT_MANUFACTURER := LGE
PRODUCT_RESTRICT_VENDOR_FILES := false

# Device Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=bullhead \
    BUILD_FINGERPRINT=google/bullhead/bullhead:6.0.1/MTC19T/2741993:user/release-keys \
    PRIVATE_BUILD_DESC="bullhead-user 6.0.1 MTC19T 2741993 release-keys"


# Inline kernel building
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/aarch64/aarch64-$(TARGET_GCC_VERSION_KERNEL)/bin
KERNEL_TOOLCHAIN_PREFIX := aarch64-
TARGET_KERNEL_SOURCE := kernel/lge/bullhead
TARGET_KERNEL_CONFIG := thug_defconfig
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="Omkar Shinde (Megatron007)"

include vendor/screwd/configs/screwd.mk
endif
