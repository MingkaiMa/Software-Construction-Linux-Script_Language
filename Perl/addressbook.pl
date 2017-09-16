#!/usr/bin/perl -w

$people_file = "people.txt";
$phone_file = "phones.txt";

%dic_people = ();
%dic_phone = ();

open F, '<', $people_file or die;
chomp(@people = <F>);
close F;

open F, '<', $phone_file or die;
chomp(@phone = <F>);
close F;


foreach $var (@people){
	my @record = split /,/, $var;
	$dic_people{$record[0]}[0] = $record[1];
	$dic_people{$record[0]}[1] = $record[2];
	$dic_people{$record[0]}[2] = $record[3];	
}

foreach $var (@phone){
	my @record = split /,/, $var;
	$dic_phone{$record[0]}{$record[1]} = $record[2];
}

@name_alias = keys %dic_people;
@name_alias = sort @name_alias;
for $name (@name_alias){
	if(exists($dic_phone{$name})){
		print "$dic_people{$name}[0]\n";
		print "$dic_people{$name}[1], $dic_people{$name}[2]\n";
		print "Phones: ";
		if($dic_phone{$name}{'mobile'}){
			print "$dic_phone{$name}{'mobile'} (mobile)";
			if($dic_phone{$name}{'home'}){
				print ", ";
			}
		}
		if($dic_phone{$name}{'home'}){
			print "$dic_phone{$name}{'home'} (home)";
			if($dic_phone{$name}{'work'}){
				print ", ";
			}
		}	
		if($dic_phone{$name}{'work'}){
			print "$dic_phone{$name}{'work'} (work)\n";
		}
		
	}else{
		print "$dic_people{$name}[0]\n";
		print "$dic_people{$name}[1], $dic_people{$name}[2]\n";
		print "Phones: ?\n";		
	}
	print "\n";
}

