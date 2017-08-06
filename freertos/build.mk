L_PATH := $(call cur-dir)

include $(DEFINE_LOCAL)

L_MODULE := freertos

L_CFLAGS := -Wall

L_INCS := \
	$(L_PATH)/include/ \
	$(L_PATH)/portable/GCC/ARM_CM3

L_SRCS += tasks.c
L_SRCS += ./portable/MemMang/heap_2.c
L_SRCS += timers.c
L_SRCS += queue.c
L_SRCS += list.c
L_SRCS += croutine.c
L_SRCS += event_groups.c
L_SRCS += portable/GCC/ARM_CM3/port.c

include $(BUILD_MODULE)

