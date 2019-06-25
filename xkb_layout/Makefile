
.PHONY: install

default : install

install: bepo_code.xkb
	-mkdir ~/.xkb
	-mkdir ~/.xkb/symbols
	-mkdir ~/.xkb/map
	cp -f bepo_code.map ~/.xkb/map
	setxkbmap -I ~/.xkb bepo_code.xkb -print | xkbcomp -I${HOME}/.xkb/ - ${DISPLAY}

remove: