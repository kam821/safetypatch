# **SafetyPatcher**
## Description
Fixes safetynet basicIntegrity & CTS on most devices, after you've applied magiskhide
## Changelog
- A1 - Initial alpha
- v1 - Includes fixes for OP3 and other devices with messed up cases in the bootloader
- V2 - Adds a load of stuff so that it now also has a GUI (run safetypatcher in shell as root) and also passes CTS.
## Requirements
- Magisk
- Magisk Hide (https://www.didgeridoohan.com/magisk/MagiskHide)
## Instructions
1. Flash in Magisk Manager
2. Reboot
3. Comment on XDA to share your experience

Or to use without Magisk (TODO: update for V2)...

1. Enable ADB.
3. Run `adb shell sed 's/ORANGE/GREEN/i' /proc/cmdline | sed 's/YELLOW/GREEN/i' > /data/local/tmp/cmdline` from computer with connected and authorized ADB/USB
4. `adb shell mount -o bind /data/local/tmp/cmdline /proc/cmdline` from computer with connected and authorized ADB/USB
5. Comment on XDA to share your experience
## Links
[Module XDA Forum Thread](https://forum.xda-developers.com/apps/magisk/module-safetypatcher-t3809879 "Module official XDA thread")

[Latest stable Magisk](http://www.tiny.cc/latestmagisk) or Beta if you want
