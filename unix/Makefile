TARGET = dvorak
LIBS = -lm -lX11
CC = gcc
CFLAGS = -g -Wall

.PHONY: default all clean

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
	-rm -f *.o
	-rm -f $(TARGET)

install:
	cp $(TARGET) /usr/bin/
	cp 80-dvorak.rules /etc/udev/rules.d/
	cp dvorak@.service /etc/systemd/system/
	sudo udevadm control --reload-rules
	sudo udevadm trigger
	sudo systemctl restart udev.service
	systemctl daemon-reload
	systemctl start dvorak@event3.service
remove:
	systemctl stop dvorak@event3.service
	rm -f /usr/bin/$(TARGET)
	rm -f /etc/udev/rules.d/80-dvorak.rules 
	rm -f /etc/systemd/system/dvorak@.service
	sudo udevadm control --reload
	sudo systemctl restart udev.service
	systemctl daemon-reload