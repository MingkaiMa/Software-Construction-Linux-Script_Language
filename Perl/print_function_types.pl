#!/usr/bin/perl -w

$file = $ARGV[0];
open F, '<', $file or die;
@lines = <F>;
close F;

foreach $line(@lines){
	if($line =~ m/([a-z]+) *([a-z]+) *\(([a-z *\*]+) *([a-z]+)\)/){
		print "function type='$1'\n";
		print "function name='$2'\n";
		print "parameter type='$3'\n";
		print "parameter name='$4'\n";
	}
}
