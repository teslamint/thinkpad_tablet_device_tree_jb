# Inherit device configuration
$(call inherit-product, device/LENOVO/Indigo/cm.mk)

## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)
# Inherit 3G
$(call inherit-product, device/LENOVO/IndigoF/device_IndigoF.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := IndigoF
PRODUCT_NAME := cm_IndigoF
PRODUCT_BRAND := Lenovo
PRODUCT_MODEL := ThinkPadTablet
PRODUCT_MANUFACTURER := LENOVO

# Release name
PRODUCT_RELEASE_NAME := IndigoF
