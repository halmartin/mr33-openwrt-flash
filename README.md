# Install OpenWRT on Cisco Meraki MR33

When the installed uboot is newer than verison 2012.7 start at `./uboot2012`

## Getting started

1. Connect to serial

| Pin | Serial | Comment     |
| 1   |        | White Arrow |
| 2   | Rx     |             |
| 3   | Tx     |             |
| 4   | GND    |             |

### Settings
115200 baud rate
8 data bits
no parity bit
1 stop bit

```
screen /dev/tty.usbserial-0001 115200
```

2. Start flashing OpenWRT
```
chmod a+x ubootwrite.py
./ubootwrite.py --serial=/dev/tty.usbserial-0001 --write=mr33-uboot.bin
```

Now power up the MR33 and wait for the message `Hello from MR33 U-BOOT`.

3. Upload initramfs image

Connect LAN to the MR33. It's listening on 192.168.1.1. Now you can upload the initramfs with tftp.

```
echo -e "binary\nput openwrt-ipq40xx-meraki_mr33-initramfs-fit-uImage.itb" | tftp 192.168.1.1
```

4. Upload images for later use

```
scp openwrt-* root@192.168.1.1:/tmp
```

5. Connect with ssh

```
ssh root@192.168.1.1
```

Now wait for the MR33 to reboot.

## Credits

- https://openwrt.org/toh/meraki/mr33
- https://drive.google.com/drive/folders/1jJa8LzYnY830v3nBZdOgAk0YQK6OdbSS
  - Source of
    - ubootwrite.py
    - mr33-uboot.bin
    - openwrt-18.06.1-ipq40xx-meraki_mr33-initramfs-fit-uImage.itb
    - openwrt-18.06.1-ipq40xx-meraki_mr33-squashfs-sysupgrade.bin