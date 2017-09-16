#!/usr/bin/perl -w

$nb_of_line = 10;
$n = 0;
if (@ARGV == 1){
	
	$ARGV[0] =~ s/\-//;
	$nb_of_line = $ARGV[0]	
}else{
	$nb_of_line = 10;	
}

@lines = <STDIN>;
if($nb_of_line >= @lines){
	print "---";
	print @lines;
}else{
	while($n < $nb_of_line){
		print $lines[$n];
		$n++;		
	}
}

