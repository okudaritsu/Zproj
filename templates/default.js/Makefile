NODE = node

.PHONY: all clean run install

all: install clean run

run: main.js
	$(NODE) main.js

install: package.json
	npm install

clean:
	rm -rf .npm