#Our new web server requires all HTML files have the suffix .html. 
#Unfortunately we have many HTML files named with the suffix .htm.
#Write a shell script htm2html.sh which changes the name of all files 
#with the suffix .htm in the current directory to have the suffix .html. For example:
#touch index.htm small.htm large.htm
#ls *.htm*
#index.htm  large.htm  small.htm
#./htm2html.sh
#ls *.htm*
#index.html  large.html  small.html

#!/bin/sh
filename_0=
filename_without_extension_0=
f_html_0=

filename=
filename_without_extension=
f_html=

for n in *.htm
do
        filename_0="$n"
        filename_without_extension_0=`echo "${filename_0%.*}"`
        f_html_0="$filename_without_extension_0.html"

        if test -e "$f_html_0"
        then
                echo "$f_html_0 exists"
                exit 1
        fi
done

for n in *.htm
do

        filename="$n"
        l=`echo "${filename%.*}"`
        f_html="$l.html"
        cp "$n" "$f_html"
        rm "$n"
done
