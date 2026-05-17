HHC = ghc
FLAGS = -O2 -Wall

.PHONY: all clean
all: clean PROJECTNAME
PROJECTNAME: Main.hs PROJECTNAME.hs
	$(HHC) $(FLAGS) Main.hs -o $@
clean:
	rm -f *.o *.hi PROJECTNAME