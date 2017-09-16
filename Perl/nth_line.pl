#!/usr/bin/perl -w

$nb = $ARGV[0];
$file_name = $ARGV[1];

$n = 1;
open F, '<', $file_name or die;
foreach $line (<F>){
	if ($n == $nb){
		print $line;
		exit 0;
	}
	$n++;
}
