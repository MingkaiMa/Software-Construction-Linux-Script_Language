#Write a shell script jpg2png.sh which converts all images in JPEG format in the current directory to PNG format.
#You can assume that JPEG files and only JPEG files have the suffix jpg.
#If the conversion is succesful the JPEG file should be removed.
#Your script should stop with the error message shown below and exit status 1 if the PNG file already exists.

#!/bin/sh

filename_0=
filename_without_extension_0=
f_png_0=

filename=
filename_without_extension=
f_png=

for n in *.jpg
do
	filename_0="$n"
	filename_without_extension_0=`echo ${filename_0%.*}`
	f_png_0="$filename_without_extension_0.png"
	
	if test -e "$f_png_0"
	then
		echo "$f_png_0 already exists"
		exit 1
	fi
done

for n in *.jpg
do	
	filename="$n"
	filename_without_extension=`echo ${filename%.*}`
	f_png="$filename_without_extension.png"
	convert "$n" "$f_png"
	rm "$n"
done
	
	
	
	
