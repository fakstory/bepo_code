TARGET = dvorak
LIBS = -lm -lX11
CC = gcc
CFLAGS = -g -Wall

.PHONY: default all clean update

default: $(TARGET)
all: default

OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))
HEADERS = $(wildcard *.h)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

.PRECIOUS: $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -Wall $(LIBS) -o $@

clean:

install: dvorak.o
	cp $(TARGET) /usr/bin/
	cp 80-dvorak.rules /etc/udev/rules.d/
	cp dvorak@.service /etc/systemd/system/
	sudo udevadm control --reload-rules
	sudo udevadm trigger
	# sudo systemctl restart udev.servicep
	systemctl daemon-reload
	-systemctl start dvorak@event3.service
	localectl set-keymap --no-convert bepo_code

remove:
	-systemctl stop dvorak@event3.service
	rm -f /usr/bin/$(TARGET)
	rm -f /etc/udev/rules.d/80-dvorak.rules 
	rm -f /etc/systemd/system/dvorak@.service
	sudo udevadm control --reload
	# sudo systemctl restart udev.service
	systemctl daemon-reload
	touch .remove

update: .remove, .install
