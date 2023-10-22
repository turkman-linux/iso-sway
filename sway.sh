#!/bin/sh
#X11 install
ymp repo --update --allow-oem --ignore-gpg
ymp it sway eudev elogind freetype seatd xkeyboard-config @x11.drivers --no-emerge --allow-oem
rc-update add elogind
rc-update add eudev
rc-update add seatd
ymp clean --allow-oem
exit 0
