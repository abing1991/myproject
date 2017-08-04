L_PATH := $(call cur-dir)

include $(DEFINE_LOCAL)

L_MODULE := src

L_CFLAGS := -Wall

L_INCS := \
	$(MK_BASE_PATH)/lib/CMSIS/CM3/DeviceSupport/ST/STM32F10x/ \
	$(MK_BASE_PATH)/lib/CMSIS/CM3/CoreSupport \
	$(MK_BASE_PATH)/lib/STM32F10x_StdPeriph_Driver/inc

L_SRCS += main.c

include $(BUILD_MODULE)

