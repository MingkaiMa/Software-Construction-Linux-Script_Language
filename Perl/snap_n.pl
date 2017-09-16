#!/usr/bin/perl -w

$snap = $ARGV[0];

%data = ();

while($line = <STDIN>){
	if(exists($data{$line})){
		$data{$line}++;
		if($data{$line} == $snap){
			print "Snap: $line";
			last;
		}	
	}else{
		$data{$line} = 1;	
	}
}

