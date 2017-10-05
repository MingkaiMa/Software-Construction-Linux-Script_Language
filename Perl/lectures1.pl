#!/usr/bin/perl -w

%data = ();
$flag = 0;

foreach $arg (@ARGV){
	if($arg eq "-d"){
		$flag = 1;
		next;
	}
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
				if($flag == 0){
					print "$arg: $s$w\n";
				}else{
				$w =~ s/\(.*?\)//g;
				#print "$w\n";
				@lst_1 = split /,/, $w;
				foreach $slot(@lst_1){
					my @lst_2 = split / /, $slot;
					#foreach(@lst_2){
					#	print;
					#	print "--\n";
					#}
					#print "$lst_2[1]\n";
					#print "$lst_2[2]\n";
					$h_1 = substr $lst_2[2], 0, 2;
					$h_2 = substr $lst_2[4], 0, 2;
					#print "$lst_2[4]\n";
					#print "$h_1\n";
					#print "$h_2\n";
					$start = $h_1;
					while($start < $h_2){
						$start =~ s/^0+//;
						$r_2 = "$s $arg $lst_2[1] $start\n";
						if(exists($data{$r_2})){
							;
						}else{
							$data{$r_2} = 1;
							print "$s $arg $lst_2[1] $start\n";
						}
						$start++;
					}
				}
				}
			
			}			
			$n++;
			next;	
		}else{
			$n++;
		}
	}
}	

