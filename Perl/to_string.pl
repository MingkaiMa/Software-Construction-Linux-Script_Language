#!/usr/bin/perl -w

if(@ARGV != 1){
	print "Need only one argument.\n";
	exit 1;
}

$N = $ARGV[0];
$n = 0;
$result = "";
if($n == $N){
	exit;	
}
while($line = <STDIN>){
	chomp($line);
#	$result = "$result$line";
	$result .= $line;
	$n++;
	if($n == $N){
		last;
	}

}

print "$result\n";
