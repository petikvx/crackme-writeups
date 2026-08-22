AS=fasm
RM?=rm
OBJS=crackme.o

all: crackme

crackme: crackme.asm
	$(AS) $<
	

clean:
	$(RM) crackme

.PHONY: all clean
