#!/usr/bin/perl -w

$pattern = 0;


if(@ARGV == 1){
	$pattern = $ARGV[0];		


@file = <STDIN>;
foreach $line (@file){
	if($line =~ /$pattern/){
		print $line;
	}
}

}else{
	$pattern = $ARGV[0];
	foreach $file (@ARGV[1..$#ARGV]){
		open F, '<', $file or die "Can't open file $!\n";
		@lines = <F>;
		foreach(@lines){
			if($_ =~ /$pattern/){
				print $_;
			}
		}
	}	
}

