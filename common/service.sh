#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
[ -f "$MODDIR/safetypatch_conf" ] && . $MODDIR/safetypatch_conf || exit 0

if [ "$CHMOD_CHANGE_ENABLED" = true ]; then
  for CHMOD_CHANGE_PATH in "${CHMOD_CHANGE_PATHS[@]}"; do
    chmod ${CHMOD_CHANGE_VALUE} "${CHMOD_CHANGE_PATH}" >&2
  done
fi