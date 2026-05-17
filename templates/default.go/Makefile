BINARY_NAME = PROJECTNAME

.PHONY: all clean build run
all: clean run
build:
	go build -o $(BINARY_NAME) main.go
run:
	go run main.go
clean:
	rm -f $(BINARY_NAME)