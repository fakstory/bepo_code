#!/bin/sh

cp -p /usr/share/X11/xkb/symbols/fr ./Backup/fr_backup
sudo cp ./fr /usr/share/X11/xkb/symbols/fr

cp /usr/share/X11/xkb/rules/evdev.xml ./Backup/evdev.xml_backup
sudo cp evdev.xml /usr/share/X11/xkb/rules/evdev.xml

dpkg-reconfigure xkb-data
systemctl restart keyboard-setup
