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
#########################################################################################

CPRE := @
ifeq ($(V),1)
CPRE :=
endif
##########################################################################################

MK_OUT_TARGET_FILE := $(MK_OUT_PATH_LIB)/$(MK_OUT_TARGET)
$(MK_OUT_TARGET_FILE): PRIVATE_LDFLAGS:=$(LDFLAGS)
TARGET_FILE_OBJS:= $(MK_L_OBJS)
$(MK_OUT_TARGET_FILE): $(TARGET_FILE_OBJS)
	@mkdir -p $(dir $@)
	@echo [AR] $@
	$(CPRE)$(AR) $(PRIVATE_LDFLAGS) -o $@ $^

.PHONY:image
image: $(MK_OUT_TARGET_FILE) auto_config

all: image

.PHONY:clean
clean:
	rm -rf $(MK_OUT_PATH)
