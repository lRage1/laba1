cc=GCC
CFLAGS=-Wall
LDFLAGS=-lm

sudo apt-get update && sudo apt-get install - build-essential gdb
all:
	g++ first.cpp -o first
