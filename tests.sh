#!/bin/bash

Green="\e[32m"
Red="\e[31m"
Default="\e[39m"
Check="\xE2\x9C\x94"
Cross="\xE2\x9D\x8C"

test() {
	eval $(echo $1 | tr -d \") > bash_output
	if [ -z "$(diff my_output bash_output)" ]
	then
		echo -n -e $Green $Check
	else
		echo $1
		echo -e $Red "Wrong" $Cross
		echo "$(diff my_output bash_output)"
	fi
	echo -e $Default
}

pipe_tests() {
	echo "Pipe Tests:"
	./microshell "/bin/cat" "-e" "main.c" "|" "/usr/bin/grep" "int" > my_output
	test '"/bin/cat" "-e" "main.c" "|" "/usr/bin/grep" "int"'
	./microshell "/bin/ls" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" > my_output
	test '"/bin/ls" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"'
	./microshell "/bin/ls" "|" "/bin/cat" "-e" "|" "/usr/bin/grep" "microshell" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"\
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"\
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"\
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"\
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"\
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"\
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"\
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"\
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"\
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" > my_output
	test '"/bin/ls" "|" "/bin/cat" "-e" "|" "/usr/bin/grep" "microshell" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"'
	./microshell "/bin/ls" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"\
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"\
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"\
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"\
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"\
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"\
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"\
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"\
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"\
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" > my_output
	test '"/bin/ls" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"
	"|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e" "|" "/bin/cat" "-e"'
	./microshell "/bin/cat" "|" "/bin/echo" "lala" > my_output
}

semicolon_tests() {
	
}

make
chmod 755 microshell
pipe_tests
