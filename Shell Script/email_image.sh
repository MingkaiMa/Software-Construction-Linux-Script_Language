#Write a shell script email_image.sh which given a list of image files as arguments 
#displays them one-by-one. After the user has viewed each image the script should prompt 
#the user for an e-mail address. If the user does enter an email address, 
#the script should prompt the user for a message to accompany the image 
#and then send the image to the specified e-mail address.


#!/bin/sh

subject=

for n in "$@"
do
	display "$n"
	subject=$(echo "$n"| sed 's/\..*//')
	echo -n "Address to e-mail this image to? "
	read email
	if echo "$email" | egrep '^[a-zA-Z0-9_.%&//=?^#$!+-]+@[a-zA-Z.]{2,}$'  > /dev/null
	then
		echo -n "Message to accompany image? "
		read message
		echo "$message" | mutt -s "$subject" -a "$n" -e "set copy=no" -- "$email"
		echo "$n sent to "$email""
	else
		echo "Invalid e-mail address. giving up..."
	fi
done

