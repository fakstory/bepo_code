
.PHONY: install

default : install

install:

	sudo touch /etc/modules-load.d/uinput.conf
	sudo echo "uinput" > /etc/modules-load.d/uinput.conf
	sudo make remove -C unix/
	sleep 2
	sudo make install -C unix/
	sleep 2
	make -C xkb_layout

remove:
	sudo rm /etc/modules-load.d/uinput.conf

