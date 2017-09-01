#Write a shell script date_image.sh which, given a list of image files as arguments, 
#changes each file so it has a label added to the image indicating the time it was taken. 
#You can assume the last-modification time of the image file is the time it was taken.
#And it doesn't affect the image file's last-modification time.

#!/bin/sh

if test "$#" -eq 0
then
	echo "Need at least one argument."
	exit 1
fi

timelable=
timelable_1=
suffix=
temp=


for n in "$@"
do
	#timelable=`ls -l "$n" | tr -s ' ' ' ' | cut -d' ' -f6,7,8`
	timelable=`stat "$n" | egrep 'Modify' | cut -d' ' -f2,3`
	timelable_1="'$timelable'"
	suffix=`echo "$n" |sed 's/.*\.//'`	
	temp="temp.$suffix"
	convert -gravity south -pointsize 36 -draw "text 0,10 $timelable_1" "$n" "$n"
	touch -m -d "$timelable" "$n"
done	
