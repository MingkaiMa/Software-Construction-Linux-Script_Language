#Write a program digits.sh that reads from standard input and writes to standard output mapping all digit characters whose values 
#are less than 5 into the character '<' and all digit characters whose values are greater than 5 into the character '>'.
#The digit character '5' should be left unchanged.

#!/bin/sh

file=""

while read line
do
	file="$file\n$line"
done


s=$(echo  $file | sed 's/\\n//' | tr [0-4] '<' | tr [6-9] '>')

echo -e "$s"


