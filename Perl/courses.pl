#!/usr/bin/perl -w

$prefix = $ARGV[0];
$url = "http://www.timetable.unsw.edu.au/current/${prefix}KENS.html";
open F, "wget -q -O- '$url'|";
@lines = <F>;
close F;
%data = ();
foreach $line(@lines){
	if($line =~ m/.*($prefix[0-9]{4}).*/){
		if(exists($data{$1})){
			next;
		}else{
			$data{$1} = 1;
		}
	}
}
@result = keys %data;
@result = sort @result;

foreach(@result){
	print;
	print "\n";
}

