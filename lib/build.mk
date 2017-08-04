L_PATH := $(call cur-dir)

include $(DEFINE_LOCAL)

L_MODULE := hal_lib

L_CFLAGS := -Wall

L_INCS := \
	$(L_PATH)/STM32F10x_StdPeriph_Driver/inc/ \
	$(L_PATH)/CMSIS/CM3/DeviceSupport/ST/STM32F10x/ \
	$(L_PATH)/CMSIS/CM3/CoreSupport/
L_ASM_SRCS += \
	CMSIS/CM3/DeviceSupport/ST/STM32F10x/startup/gcc_ride7/startup_stm32f10x_md.s


L_SRCS += \
	CMSIS/CM3/DeviceSupport/ST/STM32F10x/system_stm32f10x.c \
	STM32F10x_StdPeriph_Driver/src/stm32f10x_bkp.c \
	STM32F10x_StdPeriph_Driver/src/stm32f10x_gpio.c \
	STM32F10x_StdPeriph_Driver/src/stm32f10x_rcc.c \
	STM32F10x_StdPeriph_Driver/src/stm32f10x_usart.c
#	STM32F10x_StdPeriph_Driver/src/stm32f10x_cec.c \
	STM32F10x_StdPeriph_Driver/src/stm32f10x_adc.c \
	STM32F10x_StdPeriph_Driver/src/stm32f10x_can.c 
#	STM32F10x_StdPeriph_Driver/src/stm32f10x_rtc.c 
#	STM32F10x_StdPeriph_Driver/src/stm32f10x_crc.c \
#	STM32F10x_StdPeriph_Driver/src/stm32f10x_dac.c \
#	STM32F10x_StdPeriph_Driver/src/stm32f10x_dbgmcu.c \
#	STM32F10x_StdPeriph_Driver/src/stm32f10x_dma.c \
#	STM32F10x_StdPeriph_Driver/src/stm32f10x_exti.c \
#	STM32F10x_StdPeriph_Driver/src/stm32f10x_flash.c \
#	STM32F10x_StdPeriph_Driver/src/stm32f10x_fsmc.c \
#	STM32F10x_StdPeriph_Driver/src/stm32f10x_i2c.c \
#	STM32F10x_StdPeriph_Driver/src/stm32f10x_iwdg.c \
#	STM32F10x_StdPeriph_Driver/src/stm32f10x_pwr.c \
#	STM32F10x_StdPeriph_Driver/src/stm32f10x_rcc.c \
#	STM32F10x_StdPeriph_Driver/src/stm32f10x_rtc.c \
#	STM32F10x_StdPeriph_Driver/src/stm32f10x_sdio.c \
#	STM32F10x_StdPeriph_Driver/src/stm32f10x_spi.c \
#	STM32F10x_StdPeriph_Driver/src/stm32f10x_tim.c \
#	STM32F10x_StdPeriph_Driver/src/stm32f10x_wwdg.c \
#	STM32F10x_StdPeriph_Driver/src/misc.c 

include $(BUILD_MODULE)

