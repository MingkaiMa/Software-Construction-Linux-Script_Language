#Write a Perl script digits.pl that reads from standard input and 
#writes to standard output mapping all digit characters whose 
#values are less than 5 into the character '<' and all digit characters 
#whose values are greater than 5 into the character '>'. 
#The digit character '5' should be left unchanged.

#!/usr/bin/perl -w

$result = "";
while($line = <STDIN>){
        $result = $result . $line;
}

$result =~ tr/0-4/</;
$result =~ tr/6-9/>/;

print "$result";
