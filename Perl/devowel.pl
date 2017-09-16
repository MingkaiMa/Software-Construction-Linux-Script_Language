#!/usr/bin/perl -w

@lines = <STDIN>;

foreach $var (@lines){
	$var =~ s/[AEIOUaeiou]//g;
}

print @lines;
