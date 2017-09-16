#!/usr/bin/perl -w

$c_file = $ARGV[0];

#foreach $file(glob("*")){
#	print "$file\n";
#}

open F, '<', $c_file or die;
@lines = <F>;
close F;

@list_of_h = ();


#foreach $line(@lines){
#	if($line =~ m/#include \"(.*\.h)\"/){
#		print "$1\n";
#		push @list_of_h, $1;
#	}
#}


sub get_h{
	my $file = $_[0];
	open F, '<', $file or die;
	my @lines = <F>;
	close F;
	foreach $line(@lines){
		if($line =~ m/#include \"(.*\.h)\"/){
			push @list_of_h, $1;
			get_h($1);
		}
	}


}

get_h($c_file);

$n = 0;
foreach $line(@lines){
	if($line =~ m/#include \"(.*\.h)\"/){
		if($n == 0){
			foreach $h(@list_of_h){
				open F, '<', $h or die;
				my @lines = <F>;
				close F;
				foreach(@lines){
					if($_ =~ m/#include \"(.*\.h)\"/){
						;
					}else{
						print;
					}
				}
			}
		$n++;
		}		
	}else{
		print $line;
	}
}
