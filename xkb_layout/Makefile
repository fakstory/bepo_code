
#.PHONY: install

default : install

install:
	
	mkdir -p ~/.xkb/symbols
	mkdir -p ~/.xkb/map
	
	cp -f bepo_code.map ~/.xkb/map
	cp -f bepo_code.xkb ~/.xkb/symbols
	
	setxkbmap -I ${HOME}.xkb bepo_code.xkb -print | xkbcomp -I${HOME}/.xkb/ - ${DISPLAY}
