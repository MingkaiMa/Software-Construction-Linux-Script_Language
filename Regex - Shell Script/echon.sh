#Write a shell script a program echon.sh which given exactly two arguments, 
#an integer n and a string, prints the string n times. For example:

#!/bin/sh
if test "$#" -ne 2
then
	echo "Usage: ./echon.sh <number of lines> <string>" >&2
	exit 1
fi

number="$1"
s="$2"

if ! echo "$number"| grep '^[0-9]\+$' > /dev/null
then
	echo "./echon.sh: argument 1 must be a non-negative integer" >&2
	exit 1
fi

while test "$number" -ne 0
do
	echo "$s"
	number=$((number = number - 1))
done
