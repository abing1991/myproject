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

L_PATH := $(call cur-dir)

include $(DEFINE_LOCAL)

L_MODULE := product_sensor

L_CFLAGS := -Wall -Werror

L_INCS := \
	$(L_PATH)/include/ \

L_SRCS += tasks.c
L_SRCS += timers.c
L_SRCS += queue.c
L_SRCS += list.c
L_SRCS += croutine.c
L_SRCS += event_groups.c

include $(BUILD_MODULE)

