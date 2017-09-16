#!/usr/bin/perl -w

open F, '<', $ARGV[0] or die;
@lines = <F>;
close F;
$total = @lines;

if($total == 0){
	exit;
}


if($total % 2 == 0){
	print "$lines[int($total/2) - 1]";
	print "$lines[int($total/2)]";
}else{
	print "$lines[int($total/2)]";
}

