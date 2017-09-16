#!/usr/bin/perl -w

@files = <*>;
%result = ();

foreach $file (@files){
	if($file !~ m/\.[ch]$/){
		next;
	}
	$nb_of_lines = 0;
	open F, '<', $file or die;
	while(<F>){
		$nb_of_lines++;
	}
	$result{$file} = $nb_of_lines;
	close F;
}


@key_list = keys %result;
@key_list = sort @key_list;
$total = 0;
foreach $key(@key_list){
	printf "%8s %-100s\n", $result{$key}, $key;
	$total += $result{$key};
}
printf "%8s %-100s\n", $total, "total";


