#!/bin/sh

# Full install
ubirmvol /dev/ubi0 -n 0
ubirmvol /dev/ubi0 -n 1
ubirmvol /dev/ubi0 -n 2
ubirmvol /dev/ubi0 -n 3

# Fallback
file="/tmp/openwrt-18.06.1-ipq40xx-meraki_mr33-initramfs-fit-uImage.itb"
size=$(cat "$file" | wc -c)
ubimkvol /dev/ubi0 --size="$size" --type=static --name=part.old
ubiupdatevol /dev/ubi0_0 "$file"

# Basic install
sysupgrade -v /tmp/openwrt-18.06.1-ipq40xx-meraki_mr33-squashfs-sysupgrade.bin
