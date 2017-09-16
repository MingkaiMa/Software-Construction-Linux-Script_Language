#!/usr/bin/perl -w

$nb_of_line = 10;


foreach $arg (@ARGV){
	if($arg =~ /-[1-9]+/){
		$arg =~ s/-//;	
		$nb_of_line = $arg;		
	}else{
		push @files, $arg;
	}
}

#print "$nb_of_line\n";
#print @files;
foreach $file (@files){
	open F, '<', $file or die "$0: Can't open $file: $!\n";
	if(@files > 1){
		print "==>$file<==\n";
	}
	@lines = <F>;
	$n = 0;	
	if ($nb_of_line >= @lines){
		print @lines;	
	}else{
		while($n < $nb_of_line){
			print $lines[$n];
			$n++;		
		}			
	}
	close F;
} 

