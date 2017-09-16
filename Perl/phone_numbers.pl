#!/usr/bin/perl -w

$url = $ARGV[0];

open F, "wget -q -O- $url |" or die;
while ($line = <F>){
	$line =~ s/[^0-9 \-]//g;
	#print "length is: $#line;
#	if($line =~ m/^[0-9]{8,15}$/){
#		print "$line\n";
#	}
	print "$line\n";
}
