
#.PHONY: install

default : install

install:
	mkdir -p ~/.xkb/symbols
	#cp -f bepo_code.xkb ~/.xkb/symbols
	# -mkdir ~/.xkb/map
	# cp -f bepo_code.map ~/.xkb/map
	-mkdir ${HOME}.xkb
	-mkdir ${HOME}.xkb/symbols
	cp -f bepo_code.xkb ~/.xkb/symbols
	setxkbmap -I ${HOME}.xkb bepo_code.xkb -print | xkbcomp -I${HOME}/.xkb/ - ${DISPLAY}
	#setxkbmap -I ${PWD}/xkb bepo_code.xkb -print | xkbcomp -I${PWD}/xkb/ - ${DISPLAY}

remove: