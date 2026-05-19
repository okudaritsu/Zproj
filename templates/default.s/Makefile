flags=-f elf
ldflags=

.PHONY: clean

all: PROJECTNAME

PROJECTNAME: PROJECTNAME.o
	ld $^ -o $@ $(ldflags)

PROJECTNAME.o: PROJECTNAME.s PROJECTNAME.inc
	nasm $(flags) $<

clean:
	rm -f *.o PROJECTNAME

