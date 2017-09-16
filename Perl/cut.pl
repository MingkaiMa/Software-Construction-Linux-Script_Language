#!/usr/bin/perl -w

if (@ARGV != 3){
	print "Three arguments\n";
	exit 1;
}

$start_char = $ARGV[0];
$end_char = $ARGV[1];
$file_name = $ARGV[2];

open F, '<', $file_name or die;
foreach $line (<F>){
	#my @split_line = split //, $line;
	#print @split_line[$start_char..$start_char+$end_char-1];
	#print "\n";
	
	print substr $line, $start_char, $end_char;
	print "\n";
}
close F;
