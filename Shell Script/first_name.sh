#Write a shell script first_name.sh which takes the name of a file as a command-line argument, 
#The file will contain enrolment data in the above format. first_name.sh should print a single line of output. 
#This line should contain only the most common first name for COMP[29]041 students in the enrollment data. For example:
###./first_name.sh enrollments.txt
###Vanessa

#!/bin/sh

egrep 'COMP[29]041' "$1" | cut -d'|' -f3| cut -d',' -f2 | sed 's/ //' | cut -d' ' -f1 | sort | uniq -c | sort | tail -1|sed 's/[^a-zA-Z]*//'
