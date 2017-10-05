#!/usr/bin/perl -w


%data = ();
%data_2 = ();
$flag = 0;

foreach $arg (@ARGV){
	if($arg eq "-d"){
		$flag = 1;
		next;
	}
	if($arg eq "-t"){
		$flag = 2;
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
				}elsif($flag == 1){
				$w =~ s/\(.*?\)//g;
				@lst_1 = split /,/, $w;
				foreach $slot(@lst_1){
					my @lst_2 = split / /, $slot;
					$h_1 = substr $lst_2[2], 0, 2;
					$h_2 = substr $lst_2[4], 0, 2;
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
				}elsif($flag == 2){
					$w =~ s/\(.*?\)//g;
					@lst_1 = split /,/, $w;
					foreach $slot(@lst_1){				
						my @lst_2 = split / /, $slot;
						$h_1 = substr $lst_2[2], 0, 2;
						$h_2 = substr $lst_2[4], 0, 2;
						$start = $h_1;
						while($start < $h_2){
							$start =~ s/^0+//;
							$r_2 = "$s $arg $lst_2[1] $start\n";
							if(exists($data{$r_2})){
								;
							}else{
								$data{$r_2} = 1;
								if(exists($data_2{$s}{$lst_2[1]}{$start})){
									$data_2{$s}{$lst_2[1]}{$start}++;
									#print "exists:  $s $lst_2[1] $start\n";
								}else{
									$data_2{$s}{$lst_2[1]}{$start} = 1;	
									#print "new: $s $lst_2[1] $start\n";
								}
														
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

#print "$data_2{'S1'}{'Mon'}{18}\n" if $data_2{'S1'}{'Mon'}{18};
#print "-------------->>>>>>>>\n";	
#print "$flag\n";

#print "check !!!! $data_2{'S1'}{'Mon'}{9}\n";
if($flag == 2){
	
	if($data_2{'S1'}){
	print "S1       Mon   Tue   Wed   Thu   Fri\n";
	@time_list = (9..20);

	foreach $time(@time_list){
		$print_time = "0" . $time . ":00" if $time == 9;
		$print_time = $time . ":00" if $time > 9;
		print "$print_time     ";
		if($data_2{'S1'}{'Mon'}{$time}) {print "$data_2{'S1'}{'Mon'}{$time}"} else{print " "};
		print "     ";
		if($data_2{'S1'}{'Tue'}{$time}) {print "$data_2{'S1'}{'Tue'}{$time}"} else{print " "};
		print "     ";
		if($data_2{'S1'}{'Wed'}{$time}) {print "$data_2{'S1'}{'Wed'}{$time}"} else{print " "};
		print "     ";
		if($data_2{'S1'}{'Thu'}{$time}) {print "$data_2{'S1'}{'Thu'}{$time}"} else{print " "};
		print "     ";
		if($data_2{'S1'}{'Fri'}{$time}) {print "$data_2{'S1'}{'Fri'}{$time}"} else{print " "};
		print "\n";
	}
	}
	
	if($data_2{'S2'}){
        print "S2       Mon   Tue   Wed   Thu   Fri\n";
        @time_list = (9..20);

        foreach $time(@time_list){
                $print_time = "0" . $time . ":00" if $time == 9;
                $print_time = $time . ":00" if $time > 9;
                print "$print_time     ";
                if($data_2{'S2'}{'Mon'}{$time}) {print "$data_2{'S2'}{'Mon'}{$time}"} else{print " "};
                print "     ";
                if($data_2{'S2'}{'Tue'}{$time}) {print "$data_2{'S2'}{'Tue'}{$time}"} else{print " "};
                print "     ";
                if($data_2{'S2'}{'Wed'}{$time}) {print "$data_2{'S2'}{'Wed'}{$time}"} else{print " "};
                print "     ";
                if($data_2{'S2'}{'Thu'}{$time}) {print "$data_2{'S2'}{'Thu'}{$time}"} else{print " "};
                print "     ";
                if($data_2{'S2'}{'Fri'}{$time}) {print "$data_2{'S2'}{'Fri'}{$time}"} else{print " "};
                print "\n";
        }
	}
}else{
	;	
}

