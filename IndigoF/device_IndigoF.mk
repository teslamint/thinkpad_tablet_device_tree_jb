$(call inherit-product, device/LENOVO/IndigoF/proprietary/copy.mk)
$(call inherit-product, device/LENOVO/IndigoF/configfiles/copy.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    3g.module = f5521gw

# Inherit some common stuff.
$(call inherit-product, build/target/product/full_base_telephony.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config = mtp,adb \

PRODUCT_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
