#Write a shell script file_sizes.sh which prints the names of the files in 
#the current directory splitting them into three categories: small, medium-sized and large. 
#A file is considered small if it contains less than 10 lines, medium-sized if contains less than 100 lines, 
#otherwise it is considered large.
#Your script should always print exactly three lines of output. 
#Files should be listed in alphabetic order on each line. 
#Your shell-script should match character-for-character the output shown in the example below. 
#Notice the creation of a separate direcory for testing and the use of the script from the last question to produce test files. 
#You could also produce test files manually using an editor.

#!/bin/sh

small="Small files:"
medium="Medium-sized files:"
large="Large files:"

size=""

for n in *
do
	size=$(wc -l $n | cut -d' ' -f1)
	if test "$size" -lt 10
	then
		small="$small $n"
	elif test $size -lt 100
	then
		medium="$medium $n"
	else
		large="$large $n"
	fi
done

echo "$small"
echo "$medium"
echo "$large"
			


	

