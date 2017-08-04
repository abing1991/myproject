CPRE := @
ifeq ($(V),1)
CPRE :=
endif
##########################################################################################
#$(CPRE)$(AR) $(PRIVATE_LDFLAGS) -o $@ $^

MK_OUT_TARGET_FILE := $(MK_OUT_PATH_LIB)/$(MK_OUT_TARGET)
$(MK_OUT_TARGET_FILE): PRIVATE_LDFLAGS:=$(LDFLAGS)
TARGET_FILE_OBJS:= $(MK_L_OBJS)
$(MK_OUT_TARGET_FILE): $(TARGET_FILE_OBJS)
	@mkdir -p $(dir $@)
	@echo [AR] $@
	$(CPRE)$(LD) $(LDFLAGS) -o $@ $^ 
	$(CPRE)$(OBJDUMP) -S $(MK_OUT_TARGET_FILE) > $(MK_OUT_TARGET_FILE).asm 

.PHONY:image
image: $(MK_OUT_TARGET_FILE) auto_config

all: image

.PHONY:clean
clean:
	rm -rf $(MK_OUT_PATH)
