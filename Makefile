
.PHONY: install

default : install

install:
	sudo make remove -C unix/
	sleep 2
	sudo make install -C unix/
	sleep 2
	make -C xkb_layout

remove: