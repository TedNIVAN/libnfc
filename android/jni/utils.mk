LOCAL_PATH := $(call my-dir)

LIBNFC_ROOT_REL:= ../..
LIBNFC_ROOT_ABS:= $(LOCAL_PATH)/../..

#nfc-list
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
  $(LIBNFC_ROOT_REL)/utils/nfc-utils.c \
  $(LIBNFC_ROOT_REL)/utils/nfc-list.c

LOCAL_C_INCLUDES := $(LIBNFC_ROOT_REL) $(LIBNFC_ROOT_REL)/include $(LIBNFC_ROOT_REL)/libnfc $(LIBNFC_ROOT_REL)/libnfc/buses/ /tmp/libusb-0.1.12/

LOCAL_SHARED_LIBRARIES += libnfc

LOCAL_MODULE:= nfc-list

LOCAL_CFLAGS := -O2 -g -std=c99 -DSERIAL_AUTOPROBE_ENABLED
LOCAL_CFLAGS += -DHAVE_CONFIG_H -DHAVE_LIBUSB -DSYSCONFDIR=/system/etc

#LOCAL_LDLIBS += -L/tmp/libusb-0.1.12/android/libs/armeabi-v7a/  -lusb01

include $(BUILD_EXECUTABLE)
