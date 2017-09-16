#!/usr/bin/perl -w

%data = ();

$data{'a'} = 3;
$data{'b'} = 2;
$data{'c'} = 1;

@key = keys %data;
@key = sort @key;
foreach(@key){
	print "$_ $data{$_}\n"
}

@key_1 = sort {$data{$a} <=> $data{$b}} keys %data;

foreach(@key_1){
	print "$_ $data{$_}\n";
}
