# **SafetyPatch**

## Description
This module increases changes to hide Magisk as much as possible

## Changelog
- v4.0.1 - redirect stderr to avoid any scripts crashing
- v4.0.0 - Completely rewrite the code [kam821]
  - New features:
    - Added configuration file: /common/safetypatch_conf
    - Security patch date is now possible to change
    - Possibility to change chmod permissions for selected files
	- Hide permissive selinux state
  - Rewritten regular expressions
  - Removed /system/bin/safetypatcher script
  - Upgrade to the latest module installer format
  - Added uninstall.sh to remove junk files after module uninstall
- v3 - Latest hachintosh5 version.
- v2 - Adds a load of stuff so that it now also has a GUI (run safetypatcher in shell as root) and also passes CTS.
- v1 - Includes fixes for OP3 and other devices with messed up cases in the bootloader
- A1 - Initial alpha

## Requirements
- Magisk
- Magisk Hide (https://www.didgeridoohan.com/magisk/MagiskHide)

## Instructions
1. Flash in Magisk Manager
2. Reboot