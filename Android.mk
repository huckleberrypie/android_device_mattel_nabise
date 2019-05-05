LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),nabise)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
