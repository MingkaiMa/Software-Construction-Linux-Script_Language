#!/usr/bin/perl -w

@lines = <STDIN>;

foreach $line (@lines){
	my @sorted_line = split /\s+/, $line;
	@sorted_line = sort @sorted_line;
	print join " ", @sorted_line;
	print "\n";
}
