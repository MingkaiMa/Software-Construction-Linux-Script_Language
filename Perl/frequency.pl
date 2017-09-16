#!/usr/bin/perl -w

$word = $ARGV[0];

%data = ();

foreach $file(glob "lyrics/*.txt"){
	open F, '<', $file or die;
	$nb_of_words = 0;
	$nb_of_word = 0;
	foreach $line(<F>){
		@lst = split /[^a-zA-Z]/, $line;
		foreach $var(@lst){
			if($var =~ m/^[a-zA-Z]+$/){
				$nb_of_words++;
			}
			$var =~ tr/A-Z/a-z/;
			if($var eq $word){
				$nb_of_word++;		
			}
		}
	}
	$data{$file}[0] = $nb_of_words;
	$data{$file}[1] = $nb_of_word;	
}

@file_list = keys %data;
@file_list = sort @file_list;

foreach $file(@file_list){
	$print_file = $file;
	$print_file =~ s/.*\///;
	$print_file =~ s/\.txt//;
	$print_file =~ s/[^a-zA-Z]/ /g;
	my $frequency = $data{$file}[1]/$data{$file}[0];
	printf "%4d/%6d = %.9f %s\n", $data{$file}[1], $data{$file}[0], $frequency,  $print_file;
}


