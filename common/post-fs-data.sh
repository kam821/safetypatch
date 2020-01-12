#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in post-fs-data mode
[ -f "$MODDIR/safetypatch_conf" ] && . $MODDIR/safetypatch_conf || exit 0

rm -f "${CMDLINE_TEMP_PATH}" 2>/dev/null
rm -f "${PROP_TEMP_PATH}" 2>/dev/null

if [ "$CMDLINE_REPLACE_ENABLED" = true ]; then
  sed "${CMDLINE_REPLACE_VALUE}" ${CMDLINE_SYSTEM_PATH} > ${CMDLINE_TEMP_PATH}
  mount -o bind ${CMDLINE_TEMP_PATH} ${CMDLINE_SYSTEM_PATH} 2>/dev/null
fi

if [ "$PROP_FINGERPRINT_ENABLED" = true ]; then
  sed "${PROP_FINGERPRINT_SED}" ${PROP_SYSTEM_PATH} > ${PROP_TEMP_PATH}
  mount -o bind ${PROP_TEMP_PATH} ${PROP_SYSTEM_PATH} 2>/dev/null

  # The build.prop thing seems to be useless, but at some point Google are sure to catch on and check in the raw build.prop to see if we're abusing getprop/resetprop.
  for PROP_FINGERPRINT_VAR in "${PROP_FINGERPRINT_VARS[@]}"; do
    resetprop ${PROP_FINGERPRINT_VAR} "${PROP_FINGERPRINT_VALUE}" 2>/dev/null
  done
fi

if [ "$PROP_SECURITYPATCH_ENABLED" = true ]; then
  for PROP_SECURITYPATCH_VAR in "${PROP_SECURITYPATCH_VARS[@]}"; do
    resetprop ${PROP_SECURITYPATCH_VAR} "${PROP_SECURITYPATCH_VALUE}" 2>/dev/null
  done
fi