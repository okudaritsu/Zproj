package main

import (
	"fmt"
	"os"
)

func main() {
	args := os.Args[1:]
	if len(args) > 0 {
		fmt.Printf("First argument: %s\n", args[0])
	}
	os.Exit(0)
}