##
 # Copyright (C) 2016 YunOS Project. All rights reserved.
 #
 # Licensed under the Apache License, Version 2.0 (the "License");
 # you may not use this file except in compliance with the License.
 # You may obtain a copy of the License at
 #
 #   http://www.apache.org/licenses/LICENSE-2.0
 #
 # Unless required by applicable law or agreed to in writing, software
 # distributed under the License is distributed on an "AS IS" BASIS,
 # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 # See the License for the specific language governing permissions and
 # limitations under the License.
##

MK_BASE_PATH:= $(shell pwd)

#####################################################################

MK_DEFCONFIG_FILE:= $(shell ls  $(MK_BASE_PATH)/.config)
ifeq ($(MK_DEFCONFIG_FILE),)
    $(error "MK_DEFCONFIG_FILE isn't set, check ./.config")
endif
include $(MK_BASE_PATH)/.config

#####################################################################

DEFINE_LOCAL:= build/core/define_local.mk
BUILD_MODULE:= build/core/build_module.mk
include $(MK_BASE_PATH)/build/core/functions.mk

#####################################################################

MK_TOOLCHAIN_PREFIX:=arm-none-eabi-
MK_OUT_PATH_SEGMENT:= out
MK_OUT_TARGET:= myproject

MK_L_OBJS:=
MK_L_SDK_OBJS:=
MK_L_LIBS:=
MK_L_PRE_LIBS:=
MK_L_EXCLUDE_LIBS:=
MK_CFLAGS:=
MK_HOST_BIN:=

LDFLAGS:= -r -T build/target/stm32_flash.ld

#####################################################################
include $(MK_BASE_PATH)/build/core/CFLAGS.mk

MK_OUT_PATH:= $(MK_OUT_PATH_SEGMENT)
MK_OUT_PATH_LIB:= $(MK_OUT_PATH)

CC:= $(MK_TOOLCHAIN_PREFIX)gcc
AR:= $(MK_TOOLCHAIN_PREFIX)ar
LD:= $(MK_TOOLCHAIN_PREFIX)ld
AS      := $(MK_TOOLCHAIN_PREFIX)as
OBJDUMP := $(MK_TOOLCHAIN_PREFIX)objdump
READELF := $(MK_TOOLCHAIN_PREFIX)readelf
OBJCOPY := $(MK_TOOLCHAIN_PREFIX)objcopy

#####################################################################
.PHONY:startup
startup: all

auto_config: $(MK_OUT_PATH)/.config $(MK_OUT_PATH)/auto_config.h
$(MK_OUT_PATH)/.config: .config
	mkdir -p $(MK_OUT_PATH) && cp .config $(MK_OUT_PATH)
$(MK_OUT_PATH)/auto_config.h: $(MK_OUT_PATH)/.config
	sh build/tools/gendefconfig.sh > $@

#####################################################################

include freertos/build.mk
include lib/build.mk
include src/build.mk

include build/core/main.mk
