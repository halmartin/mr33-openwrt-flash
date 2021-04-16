# Restore old version of uboot

## Prerequisites

- python 2.7
- pyserial
- Teensy++ 2.0
  - Flashed with https://github.com/hjudges/NORway/blob/master/NANDway/Signal%20Booster%20Edition/NANDway_SignalBoosterEdition.hex
  - Wired like this https://github.com/hjudges/NORway/blob/master/NANDway_Installation/NANDway-SignalBoosterEdition-to-UNI-48-Clip.jpg

## Steps

1. Checkout NORway
```
git clone https://github.com/hjudges/NORway.git
cd NORway
```

2. Test connection
```
python ./NANDway.py /dev/tty.usbmodem123451 0 info
```

3. Create a Dump
```
python ./NANDway.py /dev/tty.usbmodem123451 0 dump full.bin
```

4. Create image to flash
```
if=full.bin bs=$((0x738000)) count=1 > newflash-mr33.bin; dd if=ubootmr332012.bin bs=132k count=5 >> newflash-mr33.bin
```

5. Flash the ne image
```
python ./NANDway.py /dev/tty.usbmodem123451 0 vwrite newflash-mr33.bin 38 5
```

## Ressources

Image: https://www.usbjtag.com/filedownload/mr33ubootandubi.php (Source of `ubootmr332012.bin`)
NORway: https://github.com/hjudges/NORway
Guide: https://drive.google.com/drive/folders/1jJa8LzYnY830v3nBZdOgAk0YQK6OdbSS
Guide: https://github.com/riptidewave93/LEDE-MR33/issues/13#issuecomment-802309974