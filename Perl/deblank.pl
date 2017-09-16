#!/usr/bin/perl -w

foreach $file(@ARGV){
	open F, '<', $file or die;
	my @lines = <F>;
	close F;
	
	open F, '>', $file or die;
	foreach $line(@lines){
		if($line =~ m/^ *$/){
			next;
		}else{
			print F "$line";
		}
	}
	close F;
}
