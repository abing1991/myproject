COMMONFLAGS = -mcpu=cortex-m3 -mthumb -mlittle-endian
COMMONFLAGS += -msoft-float
MK_CFLAGS    = $(COMMONFLAGS)
MK_CFLAGS    += -ggdb3 $(INCLUDEPATH) -c

MK_CFLAGS    += -Wall -Wextra
MK_CFLAGS    += -finline-functions -fomit-frame-pointer
MK_CFLAGS    += -fno-builtin -fno-exceptions
MK_CLFAGS    += -nostdlib
MK_CFLAGS    += -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -ffreestanding -fno-move-loop-invariants
MK_CFLAGS    += -DSTM32F10X_MD -DUSE_STDPERIPH_DRIVER -DHSE_VALUE=8000000UL -DSYSCLK_FREQ_72MHz=72000000
MK_CFLAGS    += -O0

LDLIBS    = -lm

LDFLAGS   += $(COMMONFLAGS)  -Wl,--gc-sections
LDFLAGS   += -T build/target/stm32_flash.ld
LDFLAGS   += -specs=nano.specs
LDFLAGS   += $(LDLIBS) 
