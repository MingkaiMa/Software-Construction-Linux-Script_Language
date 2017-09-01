#!/bin/sh

file=""

while read line
do
	file="$file\n$line"
done


s=$(echo  $file | sed 's/\\n//' | tr [0-4] '<' | tr [6-9] '>')

echo -e "$s"


