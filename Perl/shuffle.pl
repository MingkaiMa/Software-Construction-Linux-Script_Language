#Write a Perl script shuffle.pl which prints its input with the lines in random order. For example:
#i=0;while [ $i -lt 5 ]; do echo $i; i=$(($i + 1)); done|./shuffle.pl
#0
#2
#3
#4
#1
#i=0;while [ $i -lt 5 ]; do echo $i; i=$(($i + 1)); done|./shuffle.pl
#2
#0
#1
#3
#4
#You are not permitted to use List::Util (it contains a shuffle function).

#!/usr/bin/perl -w

while ($new = <STDIN>){
        push @lines, $new;
}

$length = $#lines;
#print "$length\n";

for($i = $length; $i >= 0; $i--){
        $j = int(rand($i + 1));
#       print "i: $i\n";
#       print "j: $j\n";
        ($lines[$i], $lines[$j]) = ($lines[$j], $lines[$i]);
}


for $e(@lines){
        print "$e";
}
