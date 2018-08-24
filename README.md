doc here:
https://askubuntu.com/questions/482678/how-to-add-a-new-keyboard-layout-custom-keyboard-layout-definition

# 1 evdev
copy the content of evdev.txt in /usr/share/X11/xkb/rules/evdev.xml
or run:
sudo cp ./evdev.xml /usr/share/X11/xkb/rules/evdev.xml


# 2 Symbols
copy the content of fr.txt in /usr/share/X11/xkb/symbols/fr
OR
cp fr /usr/share/X11/xkb/symbols/fr

then, run those command:
dpkg-reconfigure xkb-data
systemctl restart keyboard-setup

you may have to login/out to apply correctly.


Now, you should see the layout in keyboard layout under fr bepo.
You can test with:
setxkbmap fr bepo_code

Have a look at this script: 
reloadxkb.sh
