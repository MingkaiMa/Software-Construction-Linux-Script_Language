#!/usr/bin/perl -w

@lines = <STDIN>;
$max_value = "";

foreach $line(@lines){
	if($line !~ m/[0-9]/){
		next;
	}       
 
	my $temp_line = $line;
	$temp_line =~ s/[^0-9\.\-]/ /g;
	$temp_line =~ s/\s+/ /g;
	$temp_line =~ s/\-+/\-/g;
	$temp_line =~ s/\s*$//g;
	$temp_line =~ s/\-+$//g;
	$temp_line =~ s/^ //;
	my @nb_list = split / /, $temp_line;
	foreach(@nb_list){
		if($_ !~ m/[0-9]/){
			next;
		}
		if($max_value eq ""){
			$max_value = $_;
		}else{
			if($max_value < $_){
				$max_value = $_;
			}
		}
	}
}
if($max_value eq ""){
	exit;
}

foreach $line(@lines){
	if($line =~ m/$max_value/){
		print "$line";
	}
}

