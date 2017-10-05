#!/usr/bin/perl -w

%data = ();

foreach $arg (@ARGV){
	$url = "http://timetable.unsw.edu.au/current/${arg}.html";
	open F, "wget -q -O- '$url'|";
	@lines = <F>;
	close F;
	$n = 0;	
	foreach $line(@lines){
		if($line =~ m/.*(S[12]).*Lecture/){
			$s = $1;
			$w = $lines[$n + 6];
			$w =~ s/<.*?>//;
			$w =~ s/<.*?>//;
			$w =~ s/\s+/ /g;
			$len = length($w);
			if($len == 1){
				$n++;
				next;
			}
			$r = "$arg: $s$w\n";
			if(exists($data{$r})){
				;
			}else{	
				$data{$r} = 1;
				print "$arg: $s$w\n";
			}			
			$n++;
			next;	
		}else{
			$n++;
		}
	}
}	

