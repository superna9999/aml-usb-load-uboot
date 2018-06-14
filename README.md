# Amlogic USB Burning Tool used to load Mainline U-boot without any storage

This is just "copy" of files that can be found on Amlogic Openlinux [website][amlTools].

# Installation
Create new u-dev rule for Amlogic devices (in /etc/udev/rules.d). My file is called 70-persistent-usb-amlogic.rules
Content of file is:
```
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="1b8e", ATTR{idProduct}=="c003", MODE:="0666", SYMLINK+="worldcup"
```

When you created your rule either reload udev rules or reboot your machine. Make sure that root folder of this repository is in your PATH variable (I simply put it inside my ~/bin folder) so I can call it from anywhere without specifying path.

And this tool depends on `libusb` and `libusb-compat`, you must install those tools first.

#  How to use
Connect your device and put it to USB burning mode (no storage or erase u-boot from the storages)

Copy the u-boot.bin.usb.bl2 and u-boot.bin.usb.tpl from your freshly built u-bootm then :
```
./run-uboot.sh
```

#  Note
This tool is for x64 Linux only

   [amlTools]: <http://openlinux.amlogic.com:8000/download/A113/Tool/flash-tool-v4.7/flash-tool>

