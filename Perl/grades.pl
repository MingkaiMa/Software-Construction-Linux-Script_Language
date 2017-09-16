#!/usr/bin/perl -w

chomp(@lines = <STDIN>);
@result = ();

foreach $line(@lines){
	my @record = split / /, $line;
	my $stuID = $record[0];
	my $grade = $record[1];
	if($grade !~ m/^\d+$/){
		push @result, $stuID . ' ' . '??' . ' ' . "($grade)";
	}elsif($grade > 100 or $grade < 0){
		push @result, $stuID . ' ' . '??' . ' ' . "($grade)";
	}elsif($grade >= 0 and $grade < 50){
		push @result, $stuID . ' ' . "FL";
	}elsif($grade >= 50 and $grade < 65){
		push @result, $stuID . ' ' . "PS";
	}elsif($grade >= 65 and $grade < 75){
		push @result, $stuID . ' ' . "CR";
	}elsif($grade >= 75 and $grade < 85){
		push @result, $stuID . ' ' . "DN";
	}elsif($grade >= 85 and $grade <= 100){
		push @result, $stuID . ' ' . "HD";
	}
}

foreach(@result){
	print;
	print "\n";
}
