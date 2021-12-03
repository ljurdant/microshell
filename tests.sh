#!/bin/bash

pipe_tests() {
	echo './microshell "/bin/cat" "main.c" "|" "/bin/grep" "int"'
	./microshell "/bin/cat" "main.c" "|" "/bin/grep" "int" > my_output
	/bin/cat main.c | /bin/grep int > bash_output
	diff my_output bash_output
}
make
pipe_tests
