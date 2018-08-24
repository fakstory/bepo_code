doc here:
https://askubuntu.com/questions/482678/how-to-add-a-new-keyboard-layout-custom-keyboard-layout-definition

# 1 evdev
/usr/share/X11/xkb/rules/evdev.xml
or cp this file
sudo cp ./evdev.xml /usr/share/X11/xkb/rules/evdev.xml


# 2 Symbols
copy the file in :
/usr/share/X11/xkb/symbols
OR
need to launch the reloadxkb.sh




# Use xmodmaps (Gui xkeycaps) instead!!!
https://unix.stackexchange.com/questions/91355/shortcut-keys-that-are-independent-to-keyboard-layout
https://superuser.com/questions/385748/binding-superc-superv-to-copy-and-paste

# Some Problem found with atom using xkb only...
To have same shortcut than the QWERTY Layout, use
investigate shortcut, it seems it is related to the default layout (the one that 
the system has booted with.)
for example, if I load the Colemak layout, the shortcut are still in bepo! There is
some hope!
https://github.com/atom/atom/issues/13170
https://github.com/atom/atom-keymap/pull/164

