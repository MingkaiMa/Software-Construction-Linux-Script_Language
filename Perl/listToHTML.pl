#!/usr/bin/perl -w

sub listToHTML{
	my @list = @_;
	$s = "<ul>\n";
	foreach $l(@list){
		$s .= "<li>$l\n";
	}
	$s .= "<\\ul>\n";
	
	$s;
}

$out = listToHTML('The', 'Quick', 'Brown', 'Fox');

print "$out";
