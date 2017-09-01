#Write a Perl script whale.pl which given a whale name as a command line argument, reads whale observations in the above format until the end-of-input is reached and then prints the number of pods of the specified whale and the total numbers of whales in those pods. For example:
#./whale.pl 'sperm whale'
#15 humpback
#2 orca
#2 sperm whale
#19 beluga
#2 humpback
#2 sperm whale
#4 orca
#4 pygmy right whale
#7 humpback
#1 orca
#control + d
#sperm whale observations: 2 pods, 4 individuals

#!/usr/bin/perl -w

$whale_name = $ARGV[0];
$nb_of_pod = 0;
$nb_of_indiv = 0;

@lines = <STDIN>;

foreach $var (@lines){
        if($var =~ m/[0-9]+ $whale_name/){
                $nb_of_pod++;
                $var =~ s/ [a-z]+.*$//;
                $nb_of_indiv += $var;
        }
}

print "$whale_name observations: $nb_of_pod pods, $nb_of_indiv individuals\n";
