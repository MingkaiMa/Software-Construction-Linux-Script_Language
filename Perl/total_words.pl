#!/usr/bin/perl -w

chomp(@lines = <STDIN>);


$nb_of_words = 0;
foreach $line(@lines){
	@lst = split /[^a-zA-Z]/, $line;

	foreach $var (@lst){
		if($var =~ m/^[a-zA-Z]+$/){
			$nb_of_words++;
		}
	}
}
print "$nb_of_words words\n";

