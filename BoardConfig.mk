USE_CAMERA_STUB := true

DEVICE_DIR := device/mattel/nabise
VENDOR_DIR := vendor/mattel/nabise
KERNEL_DIR := kernel/mattel/nabise

# Additional includes
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_DIR)/include

# inherit from the proprietary version
-include $(VENDOR_DIR)/BoardConfigVendor.mk

# Platform
TARGET_BOARD_PLATFORM := mt8127
TARGET_BOARD_PLATFORM_GPU := mali-450mp4

# Arch
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true

TARGET_NO_BOOTLOADER := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_BOOTLOADER_BOARD_NAME := nabise
#TARGET_OTA_ASSERT_DEVICE := nabise,NabiSE,lineage_nabise,omni_nabise,omni_NabiSE,NBTY07SMKG,TOY7,TOY7-AG,TOY7-BB,TOY7-HW

TARGET_INIT_VENDOR_LIB := libinit_nabise


BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3758096384
BOARD_USERDATAIMAGE_PARTITION_SIZE := 9274130432
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_PARTITION_SIZE := 1073741824
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false
BOARD_HAS_NO_MISC_PARTITION := true

BACKLIGHT_PATH := "/sys/class/leds/lcd-backlight/brightness"

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file

# Kernel
# We don't have kernel sources for this because Mattel apparently doesn't have one in their archives
# As if they've had a good track record when it comes to electronics
#TARGET_KERNEL_CONFIG := nabise_defconfig
#TARGET_KERNEL_SOURCE := kernel/mattel/nabise
#BOARD_KERNEL_IMAGE_NAME := zImage

TARGET_PREBUILT_KERNEL := device/mattel/nabise/kernel
#BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_CUSTOM_BOOTIMG_MK := device/mattel/nabise/mkbootimg.mk
BOARD_MKBOOTIMG_ARGS := --base 0x80000000 --pagesize 2048 --kernel_offset 0x00008000 --ramdisk_offset 0x04000000 --tags_offset 0x06900000 --board 3.0.10

# MTK
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true

# to be used with hardware/mediatek repo
BOARD_HAS_MTK := true
MTK_HWC_CHIP := mt8127
MTK_HWC_SUPPORT := true
MTK_WFD_SUPPORT := true
MTK_PQ_SUPPORT := true
MTK_ION_SUPPORT := true
MTK_HDMI_SUPPORT := false
MTK_SENSOR_SUPPORT := true

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -DMTK_HARDWARE -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CFLAGS += -DREFRESH_RATE=60
TARGET_GLOBAL_CFLAGS += -DMTK_HARDWARE
TARGET_GLOBAL_CFLAGS += -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
TARGET_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(DEVICE_DIR)/configs/egl.cfg
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_OVERLAY := true
TARGET_USES_ION := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 1024*1024
BOARD_EGL_NEEDS_HANDLE_VALUE := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true


TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_USES_MEDIA_EXTENSIONS := true

# Surfaceflinger optimization for VD surfaces
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# WIFI
BOARD_WLAN_DEVICE := MediaTek
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := /dev/wmtWifi
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_P2P := P2P
WIFI_DRIVER_STATE_CTRL_PARAM := /dev/wmtWifi
WIFI_DRIVER_STATE_ON := 1
WIFI_DRIVER_STATE_OFF := 0

# BT (added 03/10/2016)
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_DIR)/bluetooth

# RECOVERY
TARGET_RECOVERY_FSTAB := $(DEVICE_DIR)/recovery.fstab

# libxlog
TARGET_LDPRELOAD := libxlog.so:libmtk_symbols.so
LINKER_FORCED_SHIM_LIBS := /system/lib/egl/libEGL_mali.so|libxlog.so:/system/lib/egl/libGLESv1_CM_mali.so|libxlog.so:/system/lib/egl/libGLESv2_mali.so|libxlog.so:/system/lib/libMtkOmxVenc.so|libmtk_symbols.so:/system/lib/libcam_utils.so|libmtk_symbols.so:/system/vendor/lib/libwvm.so|libmtk_symbols.so


# SELinux
BOARD_SECCOMP_POLICY := $(DEVICE_DIR)/seccomp
BOARD_SEPOLICY_DIRS += $(DEVICE_DIR)/sepolicy

# Hack for building without kernel sources
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)
