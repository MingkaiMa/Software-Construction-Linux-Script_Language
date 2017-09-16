#!/usr/bin/perl -w

@result = ();
$course = $ARGV[0];
#print "$course\n";
$url_1 = "http://www.handbook.unsw.edu.au/undergraduate/courses/2017/$course.html";
$url_2 = "http://www.handbook.unsw.edu.au/postgraduate/courses/2017/$course.html";

open F, "wget -q -O- $url_1|" or die;
@lines_1 = <F>;
close F;

open F, "wget -q -O- $url_2|" or die;
@lines_2 = <F>;
close F;

#print "Undergraduate\n";
foreach $line (@lines_1){
	if($line =~ m/Prerequisite/){
#		print $line;
		my @list = split /<p>/, $line;
		my $pre_1 = $list[1];
		$pre_1 =~ s/Prerequisite[s]*//g;
		$pre_1 =~ s/Corequisite[s]*//;
	        $pre_1 =~ s/\.*<\/p>//;
#		$pre_1 =~ s/[^A-Z]*//;
		$pre_1 =~ s/[^A-Z0-9]/:/g;
		$pre_1 =~ s/:+/:/g;

		my @pre_1_list = split /:/, $pre_1;
		foreach (@pre_1_list){
			push @result, $_ if ($_ and length($_) == 8);
		}
#		print "$pre_1\n";
	}
}

#print "Postgraduate\n";
foreach $line (@lines_2){
	if($line =~ m/Prerequisite/){
		#print $line;
		my @list = split /<p>/, $line;
	        my $pre_2 = $list[1];
                $pre_2 =~ s/Prerequisite[s]*//g;
		$pre_2 =~ s/Corequisite[s]*//g;
   		$pre_2 =~ s/\.*<\/p>//;
	#	$pre_2 =~ s/[^A-Z]*//;
		$pre_2 =~ s/[^A-Z0-9]/:/g;
		$pre_2 =~ s/:+/:/g;
         
		my @pre_2_list = split /:/, $pre_2;
		foreach (@pre_2_list){
			push @result, $_ if($_ and length($_) == 8);
		}		
		#print "$pre_2\n";
	}
}

@result = sort @result;

foreach(@result){
	print "$_\n";
}

