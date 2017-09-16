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


