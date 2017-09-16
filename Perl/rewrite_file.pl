#!/usr/bin/perl -w

$file = $ARGV[0];
open F, '<', $file or die;
@lines = <F>;
close F;

open F, '>', $file or die;
foreach(@lines){
	print F "$_\n";
}
close F;

