#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in post-fs-data mode
# More info in the main Magisk thread
sed 's/ORANGE/GREEN/i' /proc/cmdline | sed 's/YELLOW/GREEN/i' > /data/local/tmp/cmdline
mount -o bind /data/local/tmp/cmdline /proc/cmdline

sed 's;^ro.*\.build\.fingerprint=.*;ro.build.fingerprint=HUAWEI/CLT-L29/HWCLT:8.1.0/HUAWEICLT-L29/128(C432):user/release-keys;' /system/build.prop > /data/local/tmp/build.prop
mount -o bind /data/local/tmp/build.prop /system/build.prop
# The build.prop thing seems to be useless, but at some point Google are sure to catch on and check in the raw build.prop to see if we're abusing getprop/resetprop.
resetprop ro.build.fingerprint 'HUAWEI/CLT-L29/HWCLT:8.1.0/HUAWEICLT-L29/128(C432):user/release-keys'
resetprop ro.bootimage.build.fingerprint 'HUAWEI/CLT-L29/HWCLT:8.1.0/HUAWEICLT-L29/128(C432):user/release-keys'
#resetprop ro.vendor.build.fingerprint 'HUAWEI/CLT-L29/HWCLT:8.1.0/HUAWEICLT-L29/128(C432):user/release-keys'
#The above caused issues (critical services not starting) on my Honor
