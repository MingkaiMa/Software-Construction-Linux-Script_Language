#!/usr/bin/perl -w

@lines = <STDIN>;

foreach $line(@lines){
	$line =~ s/[0-9]//g;
}

foreach(@lines){
	print;
}
