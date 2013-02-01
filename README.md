The different devices
==============================

    * Indigo  -> wifi only
    * IndigoF -> 3G Ericsson
    * IndigoG -> 3G Gobi
    * IndigoR -> Recovery

How to build CM10 for Thinkpad Tablet 
====================================
follow this tutorial for information how to setup environment
http://wiki.cyanogenmod.org/w/Build_for_crespo

Some moments are differ here:
1) JB 4.1. 
====================================
instead of::
   repo init -u git://github.com/CyanogenMod/android.git -b cm-10.1
or somewhat branch they will prefer you should use this::
    repo init -u git://github.com/CyanogenMod/android.git -b jellybean
so you could build JB 4.1 instead of 4.2
2) tree sync
====================================
before repo sync do:
Create a file ``local_manifest.xml`` in ``~/android/system (or whatever folder you will use to store build)/.repo``, with the following content::
    <?xml version="1.0" encoding="UTF-8"?>
    <manifest>
        <project path="device/LENOVO" name="Nikolas-LFDesigns/thinkpad_tablet_device_tree_jb" revision="master" />
        <project path="kernel/LENOVO/Indigo" name="Nikolas-LFDesigns/thinkpad_tablet_jb_kernel" revision="master" />
    </manifest>

for original Koshu tree use this:
//////////////////////////////////////////////////////////////////////////////////Start of original Koshu build changes///::
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
    <project path="frameworks/base" name="Koshu/android_frameworks_base" revision="jb" />
    <project path="device/LENOVO" name="Koshu/thinkpad_tablet_device_tree_jb" revision="master" />
    <project path="kernel/LENOVO/Indigo" name="Koshu/thinkpad_tablet_jb_kernel" revision="master" />
</manifest>

also edit the file manifest.xml in ~/cm9_tpt/.repo and remove the following line::
<project path="frameworks/base" name="CyanogenMod/android_frameworks_base" /
//////////////////////////////////////////////////////////////////////////////////End of original Koshu build changes///

If you only want to build CM10 for the Thinkpad Tablet, you can also remove the following devices from ``manifest.git`` and save a lot of bandwith and harddisk space::
  <project path="device/moto/common" name="CyanogenMod/android_device_moto_common" />
  <project path="device/moto/stingray" name="CyanogenMod/android_device_moto_stingray" />
  <project path="device/moto/wingray" name="CyanogenMod/android_device_moto_wingray" />
  <project path="device/samsung/maguro" name="CyanogenMod/android_device_samsung_maguro" />
  <project path="device/samsung/toro" name="CyanogenMod/android_device_samsung_toro" />
  <project path="device/samsung/tuna" name="CyanogenMod/android_device_samsung_tuna" />

3) applying patch
====================================
After source code synced, apply framework patch to enable some device-specific features
command sequence would be::
	croot
	patch -p0 <device/LENOVO/patches/patchbuild.patch

4) build brunch
====================================::
    For wifi-only:		brunch cm_Indigo-userdebug
    For 3G-Ericsson:		brunch cm_IndigoF-userdebug
    For 3G-gobi:		brunch cm_IndigoG-userdebug
subsequently use instead of
	breakfast crespo
	brunch crespo
