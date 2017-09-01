#Write a Perl script echon.pl which given exactly two arguments, an integer n and a string, prints the string n times. For example:
#./echon.pl 5 hello
#hello
#hello
#hello
#hello
#hello
#./echon.pl 0 nothing
#./echon.pl 1 goodbye
#goodbye

#!/usr/bin/perl

die "Usage: $0 <number of lines> <string>\n" if @ARGV != 2;
die "$0: argument 1 must be a non-negative integer\n" if $ARGV[0] < 0 or $ARGV[0] !~ /^\d+$/;

$n = 0;
$s = $ARGV[1];

while($n < $ARGV[0]){
        print "$s\n";
        $n++;
}
