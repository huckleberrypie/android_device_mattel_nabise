# Release name
PRODUCT_RELEASE_NAME := nabise

# Inherit device configuration
$(call inherit-product, device/mattel/nabise/full_nabise.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)


## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := NBTY07SMKG
PRODUCT_NAME := TOY7
PRODUCT_BRAND := nabi
PRODUCT_MODEL := NBTY07SMKG
PRODUCT_MANUFACTURER := Mattel
PRODUCT_RELEASE_NAME := NabiSE
PRODUCT_GMS_CLIENTID_BASE := android-mattel
