on_install() {
  ui_print "- Extracting module files"
  unzip -oj "$ZIPFILE" module.prop uninstall.sh 'common/*' -d $MODPATH >&2
}

set_permissions() {
  ui_print "- Setting permissions"
  # The following is the default rule, DO NOT remove
  set_perm_recursive $MODPATH 0 0 0755 0644
}

SKIPUNZIP=1
on_install
set_permissions