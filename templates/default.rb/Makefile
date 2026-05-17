RUBY = ruby

.PHONY: all clean run install
all: install run
run: main.rb
	$(RUBY) main.rb
install: Gemfile
	bundle install
clean:
	rm -f Gemfile.lock