#Write a shell script courses.sh which prints a list of UNSW courses 
#with the given prefix by extracting them from the UNSW handbook webpages. For example:

#!/bin/sh

if ! test "$#" -eq 1
then
	echo "Only one parameter."
	exit 1
fi

prefix="$1"
p1=${prefix:0:1}

under_course=$(wget -q -O- "http://www.handbook.unsw.edu.au/vbook2017/brCoursesByAtoZ.jsp?StudyLevel=Undergraduate&descr=$p1"|grep $prefix | grep html| sed 's/.*2017\///' | sed 's/\.html">/ /' | sed 's/ *<.*><.*>//')
post_course=$(wget -q -O- "http://www.handbook.unsw.edu.au/vbook2017/brCoursesByAtoZ.jsp?StudyLevel=Postgraduate&descr=$p1"|grep $prefix | grep html| sed 's/.*2017\///' | sed 's/\.html">/ /' | sed 's/ *<.*><.*>//')

course="$under_course\n$post_course"

p2=${course:0:2}

if test "$p2" = "\n"
then
	echo -e "$post_course" | sort | uniq
else
	echo -e "$course" | sort | uniq 
fi






















