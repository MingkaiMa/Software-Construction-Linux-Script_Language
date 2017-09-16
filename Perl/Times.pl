#!/usr/bin/perl -w

$n1 = $ARGV[0];
$n2 = $ARGV[1];
$n3 = $ARGV[2];



for($i = 1; $i < $n1 + 1; $i++){
	printf "%4d", $i;
	for($j = 1; $j < $n2 + 1; $j++){
		printf "%${n3}d", $i * $j;	
	}
	print "\n";
}
