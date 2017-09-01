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
			


	

