#!/usr/bin/perl -w

$word = $ARGV[0];

chomp(@lines = <STDIN>);

$nb_of_word = 0;

foreach $line(@lines){
	@lst = split /[^a-zA-Z]/, $line;
	foreach $var(@lst){
		$var =~ tr/A-Z/a-z/;
		if($var eq $word){
			$nb_of_word++;
		}
	}
}

print "$word occurred $nb_of_word times\n";

