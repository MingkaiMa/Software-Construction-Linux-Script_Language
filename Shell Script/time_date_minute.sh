#!/bin/sh

minute=$(date +%M)
echo "Begining minutes: $minute"
while true
do
	echo `date`
	sleep 4
	new_minute=$(date +%M)
	#echo "Now minutes: $new_minute"
	if test "$minute" -ne "$new_minute"
	then
		exit 1
	fi
done

