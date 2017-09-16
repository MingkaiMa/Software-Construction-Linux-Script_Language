#!/bin/sh

if test "$#" -eq 0
then


	while read line
	do
		echo "$line"
	done

else
	for n in "$@"
	do
		if test ! -r “$f”
		then
			echo “no such file $f”
		else
			while read line 
			do 
				echo “$line”	
			done <$f		
	done
fi
		
