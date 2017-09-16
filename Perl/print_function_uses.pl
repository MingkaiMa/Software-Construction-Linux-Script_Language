#!/usr/bin/perl -w

$function_name = $ARGV[0];

%data = ();

foreach $file(glob("*.c")){
	open F, '<', $file or die;
	@lines = <F>;
	close F;
	my $n = 0;
	foreach $line(@lines){
		if($line !~ m/$function_name/){
			$n++;
			next;
		}
		if($line =~ m/^[a-z]+ *[a-z]+\([a-z]+ *[a-z]+\) *\{/){
			push @{$data{$file}{'defined'}}, $n;		
		}elsif($line =~ m/[a-z]+ *[a-z]+\([a-z]+ *[a-z]+\) *;/){
			push @{$data{$file}{'declared'}}, $n;
		}elsif($line =~ m/[a-z]\([^ ]+\)/){
			push @{$data{$file}{'used'}}, $n;
		}
		$n++;	
	}
}

@file_list = keys %data;
foreach $file (@file_list){
	if($data{$file}{'defined'}){
		my @l = @{$data{$file}{'defined'}};
		foreach(@l){
			my $lb = $_ + 1;
			print "$file:$lb function $function_name defined\n";
		}
	}
	if($data{$file}{'declared'}){
		my @l = @{$data{$file}{'declared'}};
		foreach(@l){
			my $lb = $_ + 1;
			print "$file:$lb function $function_name declared\n";
		}
	}
	if($data{$file}{'used'}){
		my @l = @{$data{$file}{'used'}};
		foreach(@l){
			my $lb = $_ + 1;
			print "$file:$lb function $function_name used\n";
		}	
	}
	



}
