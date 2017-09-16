#!/usr/bin/perl -w

chomp(@lines = <STDIN>);

@result = ();
$n = 0;


while($n <= $#lines){
	my @record_1 = split / /, $lines[$n];
	my @record_2 = split / /, $lines[$n + 1] if ($n < $#lines);
	my $whale_nb_1 = $record_1[0];
	my $whale_name_1 = join ' ', @record_1[1..$#record_1];
        my $whale_nb_2 = $record_2[0];
        my $whale_name_2 = join ' ', @record_2[1..$#record_2];

	if ($whale_name_1 eq $whale_name_2){
		$whale_nb_3 = $whale_nb_1 + $whale_nb_2;
		$whale_3 = $whale_nb_3 . ' ' . $whale_name_1;
		$lines[$n + 1] = $whale_3;
		$n = $n + 1;
		next;
	}else{
		push @result, $lines[$n];
		$n++;
		next;		
	}
	

	

	$n++;
}


foreach(@result){
	print;
	print "\n";
}
