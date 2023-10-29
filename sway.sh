#!/bin/sh
#X11 install
ymp repo --update --allow-oem --ignore-gpg
ymp it shadow sway foot dejavu eudev elogind freetype seatd xkeyboard-config @x11.drivers --no-emerge --allow-oem
# TODO: sway dependency
ymp it pango xcb-util-renderutil libbsd libXfont2 libmd brotli gdk-pixbuf --no-emerge --allow-oem
# weston for debug
ymp it weston --no-emerge --allow-oem
# enable login from shadow
sed -i "s|#agetty_options.*|agetty_options=\" -l /usr/bin/login\"|" /etc/conf.d/agetty
# set language
mkdir -p /lib64/locale
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "" >> /etc/locale.gen
locale-gen
sed -i "s/C/en_US/g" /etc/profile.d/locale.sh

rc-update add elogind
rc-update add eudev
rc-update add seatd
rc-update add devfs
rc-update add udhcpc
ymp clean --allow-oem
exit 0
