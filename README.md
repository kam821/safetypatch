# **SafetyPatcher**
## Description
Fixes safetynet on most devices, after you've applied magiskhide
## Changelog
A1 - Initial alpha
## Requirements
- Magisk
- Magisk Hide
- Magisk Manager for TWRP Recovery (for when things go wrong)
## Instructions
1. Flash in Magisk Manager
2. Reboot
3. Comment on XDA

Or to use without Magisk...

1. Enable ADB.
3. Run `adb shell sed 's/ORANGE/GREEN/' /proc/cmdline > /data/local/tmp/cmdline` from computer with connected and authorized ADB/USB
4. `adb shell mount -o bind /data/local/tmp/cmdline /proc/cmdline` from computer with connected and authorized ADB/USB
5. Comment on XDA
## Links
[Module XDA Forum Thread](https://forum.xda-developers.com/apps/magisk/module-safetypatcher-t3809879 "Module official XDA thread")

[Latest stable Magisk](http://www.tiny.cc/latestmagisk)
