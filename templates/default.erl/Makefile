ERLC = erlc
ERL  = erl
FLAGS = +verbose +report_errors +warn_unused_vars

.PHONY: all clean run
all: clean run
projectname.beam: projectname.erl
	$(ERLC) $(FLAGS) projectname.erl
run: projectname.beam
	$(ERL) -noshell -s projectname main -s init stop
clean:
	rm -f *.beam