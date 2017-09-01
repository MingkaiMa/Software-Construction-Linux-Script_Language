#The test data for the previous question is not really Andrew's music collection. 
#All the mp3 files contain identical contents. 
#The directories and filenames were created from the source of this web page. 
#Write a shell script create_music.sh which uses the above webpage to create exactly 
#the same directories and files as in the test data set supplied above. 
#Your script should take 2 arguments: the name of an MP3 file to use as the contents of the MP3 
#files you create and the directory in which to create the test data. For example:

#!/bin/sh

if ! test "$#" -eq 2
then
	echo "Need two arguments."
	exit 1
fi


sample="$1"
directory="$2"

add_source=$(readlink -m "$sample")

mkdir "$directory"
cd "$directory"

wget -q -O- "http://en.wikipedia.org/wiki/Triple_J_Hottest_100?action=raw" | egrep "^(\||#)" | tail -392 > web_content 

char=`head -3 web_content | grep '#' | cut -c18-20`


web_file="web_content"
web_add=$(readlink -m "$web_file")

year=
album=
track=0
title=
artist=
mp3name=
w=
p=
t=
add_target=
#echo "----"
#echo "$add_source"

#char=`head -3 web_content | grep '#' | cut -c18-20`

while read line
do

	if echo "$line" | egrep '\|-'| egrep -v 'style' > /dev/null
	then	
		
		track=0
		cd ..

	elif echo "$line" | egrep '[0-9]{4}\|[0-9]{4}' > /dev/null
	then	
		year=$(echo "$line" | cut -d'|' -f4 | cut -c1,2,3,4)
		
		album="Triple J Hottest 100, $year"
		mkdir "$album"
		cd "$album"
	elif echo "$line" | egrep '^#' | egrep -v '\([0-9]{4}\)' > /dev/null
	then

		track=$((track + 1))

		t=$(echo "$line" | tr -s "$char" '*')		

		w=$(echo "$t" | cut -d'*' -f1 | tr -s '[[]]' ',')
		IFS=","
		for l in $w
		do		
       		 	if echo "$l" | egrep '[0-9a-zA-Z]+.*\|' > /dev/null
       			then
                		p=$(echo "$l" | cut -d'|' -f2)
                		artist="$artist $p"
      		  	elif echo "$l" | egrep '[a-zA-Z]+' > /dev/null
        		then
                		artist="$artist $l"
                		
                	
			elif echo "$l" | egrep '&' > /dev/null
			then
				artist="$artist $l"
        		else
                
                		continue
        		fi
		done
		artist=$(echo "$artist" | tr -s '#' ' ')
		artist=$(echo "$artist" | sed 's/ *//' | sed 's/[^a-zA-Z]* $//' | tr -s ' ' ' ')
		

		t=$(echo "$line" | tr -s "$char" '*')	
		title=$(echo "$t" | cut -d'*'  -f2 | cut -d'|' -f2 | tr -s '[]""' ' ' | sed 's/ *//' | sed 's/ *$//')

		title=$(echo "$title" | tr '/' '-')
		mp3name="$track - $title - $artist.mp3"
		touch "$mp3name"
		add_target=$(readlink -m "$mp3name")
		
		cp "$add_source" "$add_target"
		
		artist=""
		title=""
	else	
		
		continue
	fi
					
done < "$web_file"
rm "$web_add"
