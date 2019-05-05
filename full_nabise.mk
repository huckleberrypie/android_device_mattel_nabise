DEVICE_DIR := device/mattel/nabise

# Inherit from those products. Most specific first.
$(call inherit-product, $(DEVICE_DIR)/device.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_DEVICE := nabise
PRODUCT_NAME :nabise
PRODUCT_BRAND := mattel
PRODUCT_MANUFACTURER := mattel
PRODUCT_MODEL := nabise
