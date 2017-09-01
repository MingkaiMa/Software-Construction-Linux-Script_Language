#Andrew needs help fixing the ID3 tags in the MP3 files in his music collection.
#You will write a shell script fix_id3_tags.sh which sets appropriate ID3 tags for Andrew's music collection.
#Your script will determine the appropriate ID3 tags from the directory names and file names of the music collection.
#You assume the names follow a standard format. You can determine this format by downloading Andrew's music collection.

#!/bin/sh

if test "$#" -eq 0
then
	echo "One or more arguments needed."
	exit 1
fi

filelist=
filelist_2=
title=
artist=
album=
year=
track=



for f in "$@"
do
	filelist=$(find "$f" -name "*mp3")
	if test -z "$filelist"
	then
		continue
	fi	
	filelist_2=$(echo "$filelist" | tr '\n' ':')
	IFS=":"
	for v in $filelist_2
	do
		title=$(echo "$v" | cut -d'/' -f3 | sed 's/ - /*/g' | cut -d'*' -f2)
		id3 -t "$title" "$v" > /dev/null
	
		artist=$(echo "$v" | cut -d'/' -f3 | sed 's/ - /*/g' | cut -d'*' -f3 | sed 's/\.mp3//')
		id3 -a "$artist" "$v" > /dev/null
	
		album=$(echo "$v" | cut -d'/' -f2)
		id3 -A "$album" "$v" > /dev/null		

		year=$(echo "$v" | cut -d'/' -f2 | sed 's/.*, //')
		id3 -y "$year" "$v" > /dev/null	
		
		track=$(echo "$v" | cut -d'/' -f3 | cut -d'-' -f1)
		id3 -T "$track" "$v" > /dev/null

	done
done	
	
