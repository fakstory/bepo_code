- [Remap ctrl shortcut Qwerty like](#remap-ctrl-shortcut-qwerty-like)
  - [Why is this tool useful?](#why-is-this-tool-useful)
- [## Intallation](#h2-id%22intallation-73%22intallationh2)
- [## Related Links](#h2-id%22related-links-62%22related-linksh2)
- [Dvorak <> Qwerty - Keyboard remapping for Linux when pressing CTRL or ALT](#dvorak--qwerty---keyboard-remapping-for-linux-when-pressing-ctrl-or-alt)
  - [Keyboard remapping with dvorak that works reliably with Wayland - make ctrl-c ctrl-c again](#keyboard-remapping-with-dvorak-that-works-reliably-with-wayland---make-ctrl-c-ctrl-c-again)
  - [Problems](#problems)
  - [Installation](#installation)
  - [Not a matching device: [xyz]](#not-a-matching-device-xyz)
  - [Related Links](#related-links)


# Remap ctrl shortcut Qwerty like

## Why is this tool useful?
Since I type with the "Dvorak" keyboard layout, the shortcuts such
as ctrl-c, ctrl-x, or ctrl-v are not comfortable anymore and one of them
require two hands to press.
 *
Furthermore, applications such as Intellij and Eclipse have their
shortcuts, which I'm used to. So for these shortcuts I prefer "Querty".
Since there is no way to configure this, I had to intercept the
keys and remap the keys from "Dvorak" to "Querty" once CTRL, ALT,
WIN or any of those combinations are pressed.
 *
With X.org I was reling on the wonderful tool from Kenton Varda,
which I modified a bit, to make it work when Numlock is active. Other
than that, it worked as expected.
 *
And then came Wayland. XGrabKey() works partially with some application
but not with others (e.g., gedit is not working). Since XGrabKey() is
an X.org function with some support in Wayland, I was looking for a more
stable solution. After a quick look to the repo https://github.com/kentonv/dvorak-qwerty
I saw that Kenton added a systemtap script to implement the mapping. This
scared me a bit to follow that path, so I implemented an other solution
based on /dev/uinput. The idea is to read /dev/input, grab keys with
EVIOCGRAB, create a virtual device that can emit the keys and pass
the keys from /dev/input to /dev/uinput. If CTRL/ALT/WIN is
pressed it will map the keys back to "Qwerty".

## Intallation
===========
 *
make dvorak
//make sure your user belongs to the group "input" -> ls -la /dev/input
//this also applies for /dev/uinput -> https://github.com/tuomasjjrasanen/python-uinput/blob/master/udev-rules/40-uinput.rules
//start it in startup applications

## Related Links
=============
I used the following sites for inspiration:
- https://www.kernel.org/doc/html/v4.12/input/uinput.html
- https://www.linuxquestions.org/questions/programming-9/uinput-any-complete-example-4175524044/
- https://stackoverflow.com/questions/20943322/accessing-keys-from-linux-input-device
- https://gist.github.com/toinsson/7e9fdd3c908b3c3d3cd635321d19d44d


# Dvorak <> Qwerty - Keyboard remapping for Linux when pressing CTRL or ALT

Since I type with the "Dvorak" keyboard layout, the shortcuts such as ctrl-c, ctrl-x, or ctrl-v are 
not comfortable anymore for the left hand. And even one of them require two hands to press.

Furthermore, applications such as Intellij have their shortcuts, which I'm used to. So 
for these shortcuts I prefer "Querty". Since there is no way to configure this, it is necessary to intercept the keys and remap the keys from "Dvorak" to "Querty" when pressing CTRL, ALT, WIN or any of those combinations.
   
With X.org I was relying on the wonderful project from Kenton Varda. And then came Wayland. 

## Keyboard remapping with dvorak that works reliably with Wayland - make ctrl-c ctrl-c again

XGrabKey() works partially with some application but not with others (e.g., gedit is not working). Since XGrabKey() is an X.org function with some support in Wayland, I was looking for a more stable solution. After a quick look to this [repo](https://github.com/kentonv/dvorak-qwerty), I saw that Kenton added a systemtap script to implement the mapping. It scared me a bit to follow that path, so I implemented an other solution based on /dev/uinput. The idea is to read /dev/input, grab keys with EVIOCGRAB, create a virtual device that can emit the keys and pass the keys from /dev/input to /dev/uinput. If CTRL/ALT/WIN is pressed it will map the keys back to "Qwerty".

Kenton Varda reported that this project also works with Chrome OS if started as root.

## Problems

The mapping does not work with Eclipse. Regular typing uses Dvorak, while the shortcuts are using Qwerty (I have not figured out why). This results in a situation where a Qwerty key gets remapped according to the Dvorak mapping.

## Installation

create binary with ```make```
install it with ```sudo make install```

This will copy 3 files: dvorak, 80-dvorak.rules, and dvorak@.service

The file is triggered on the udev rule and call dvorak systemd service with the device that was attached. The rule contains
the search term "keyb", that will match case insensitive the device name. Only a device with name that contains the substring
"keyb" will be considered. To prevent an endless loop, the newly created virtual device is excluded from mapping itself.

That way, dvorak will be called whenever an input device is attached.

From here, ensure that your first keyboard layout is set to Qwerty and your second layout is Dvorak.

## Not a matching device: [xyz]

If you see the above message in syslog or journalctl, it means that your keyboard device name does not have the string "keyb" (case insensitive) in it. For example, ```Not a matching device: [Logitech K360]```. In order to make it work with your device, in dvorak@.service, you can call be the executable with

```
ExecStart=/usr/bin/dvorak /dev/input/%i keyb k360
```

## Related Links
I used the following sites for inspiration:

https://www.kernel.org/doc/html/v4.12/input/uinput.html
 * https://www.linuxquestions.org/questions/programming-9/uinput-any-complete-example-4175524044/
 * https://stackoverflow.com/questions/20943322/accessing-keys-from-linux-input-device
 * https://gist.github.com/toinsson/7e9fdd3c908b3c3d3cd635321d19d44d
