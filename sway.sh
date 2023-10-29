#!/bin/sh
#X11 install
ymp repo --update --allow-oem --ignore-gpg
ymp it shadow sway foot eudev elogind freetype seatd xkeyboard-config @x11.drivers --no-emerge --allow-oem
# TODO: sway dependency
ymp it pango xcb-util-renderutil sway brotli gdk-pixbuf --no-emerge --allow-oem
# enable login from shadow
sed -i "s|#agetty_options.*|agetty_options=\" -l /usr/bin/login\"|" /etc/conf.d/agetty
rc-update add elogind
rc-update add eudev
rc-update add seatd
rc-update add devfs
ymp clean --allow-oem
exit 0
