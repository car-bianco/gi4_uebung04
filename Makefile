ASM=nasm
CC=gcc
AFLAGS=-f elf32 -g -F dwarf
LFLAGS= -m32 -g

default: fakultaet fibonacci aufgabe3a aufgabe3b aufgabe3c fibotest

fakultaet: 
	$(ASM) $(AFLAGS) fakultaet.asm
	$(CC) $(LFLAGS) fakultaet.o -o fakultaet


fibonacci: 
	$(ASM) $(AFLAGS) fibonacci.asm
	$(CC) $(LFLAGS) fibonacci.o -o fibonacci


aufgabe3a: 
	$(ASM) $(AFLAGS) aufgabe3a.asm
	$(CC) $(LFLAGS) aufgabe3a.o -o aufgabe3a


aufgabe3b: 
	$(ASM) $(AFLAGS) aufgabe3b.asm
	$(CC) $(LFLAGS) aufgabe3b.o -o aufgabe3b


aufgabe3c: 
	$(ASM) $(AFLAGS) aufgabe3c.asm
	$(CC) $(LFLAGS) aufgabe3c.o -o aufgabe3c


fibotest: 
	$(ASM) $(AFLAGS) fibotest.asm
	$(CC) $(LFLAGS) fibotest.o -o fibotest

clean:
	rm -rf *.o

veryclean: clean
	rm -rf fakultaet fibonacci aufgabe3a aufgabe3b aufgabe3c fibotest


.PHONY: default clean veryclean
