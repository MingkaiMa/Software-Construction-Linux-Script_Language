#!/usr/bin/perl -w
use List::MoreUtils qw(any);


@result = ();

foreach $var (@ARGV){
	if(any{$_ eq $var} @result){
		next;
	}else{
		push @result, $var;
	}
}

foreach (@result){
	print;
	print " ";
}
print "\n";

