#!/bin/sh

month=$(date +%m)
echo "Begining month: $month"
while true
do
	echo `date`
	sleep 3600
	new_month=$(date +%m)
	if test "$month" -ne "$new_month"
	then
		exit 1
	fi
done

