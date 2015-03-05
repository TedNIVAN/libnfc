LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LIBNFC_ROOT_REL:= ../..
LIBNFC_ROOT_ABS:= $(LOCAL_PATH)/../..

LOCAL_SRC_FILES:= \
	$(LIBNFC_ROOT_ABS)/libnfc/buses/uart.c \
	$(LIBNFC_ROOT_ABS)/libnfc/buses/usbbus.c \
	$(LIBNFC_ROOT_ABS)/libnfc/buses/empty.c \
	$(LIBNFC_ROOT_ABS)/libnfc/chips/pn53x.c \
	$(LIBNFC_ROOT_ABS)/libnfc/drivers/pn532_uart.c \
	$(LIBNFC_ROOT_ABS)/libnfc/drivers/pn53x_usb.c \
	$(LIBNFC_ROOT_ABS)/libnfc/nfc.c \
	$(LIBNFC_ROOT_ABS)/libnfc/iso14443-subr.c \
	$(LIBNFC_ROOT_ABS)/libnfc/log.c \
	$(LIBNFC_ROOT_ABS)/libnfc/log-internal.c \
	$(LIBNFC_ROOT_ABS)/libnfc/target-subr.c \
	$(LIBNFC_ROOT_ABS)/libnfc/nfc-emulation.c \
	$(LIBNFC_ROOT_ABS)/libnfc/nfc-internal.c \
	$(LIBNFC_ROOT_ABS)/libnfc/nfc-device.c \
	$(LIBNFC_ROOT_ABS)/libnfc/mirror-subr.c \
	$(LIBNFC_ROOT_ABS)/libnfc/conf.c

LOCAL_CFLAGS := -O2 -g -std=c99 -DSERIAL_AUTOPROBE_ENABLED
LOCAL_CFLAGS += -DHAVE_CONFIG_H -DHAVE_LIBUSB -DSYSCONFDIR=/system/etc
LOCAL_CFLAGS += -DDRIVER_PN53X_USB_ENABLED -DDRIVER_PN532_UART_ENABLED

LOCAL_LDLIBS += -L/tmp/libusb-0.1.12/android/libs/armeabi-v7a/  -lusb01

LOCAL_C_INCLUDES := $(LIBNFC_ROOT_REL) $(LIBNFC_ROOT_REL)/include $(LIBNFC_ROOT_REL)/libnfc $(LIBNFC_ROOT_REL)/libnfc/buses/ /tmp/libusb-0.1.12/
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE := libnfc

include $(BUILD_SHARED_LIBRARY)
