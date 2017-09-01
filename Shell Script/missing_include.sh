#We need check a large number of C programs for missing include files.
#Write a shell script missing_include.sh which is give one of more filenames as argument. The files will contain C code.
#missing_include.sh should print a message if any file included by the C program is not present in the current directory.

#!/bin/sh

for cfile in "$@"
do
        line=`egrep "#include.*\.h\"$" $cfile | sed "s/[^\"]*//" | sed 's/^\"//' | tr -cs 'a-zA-Z\.' ':'`
        IFS=":"
        for hfile in $line
        do
                if ! test -e "$hfile"
                then
                        echo "$hfile included into $cfile does not exist"
                fi
        done
done
