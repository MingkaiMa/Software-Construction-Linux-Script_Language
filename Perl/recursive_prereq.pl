#Add a -r (for recursive ) flag to prereq.pl 
#so it also lists all courses which can be used to meet a prerequisites 
#requirement of any course that can be used to meet prerequisite requirements and so on.
#Call your new program recursive_prereq.pl.

#!/usr/bin/perl -w
use List::MoreUtils qw/ uniq /;

sub get_pre{
@result = ();
$course = $_[0];
$url_1 = "http://www.handbook.unsw.edu.au/undergraduate/courses/2017/$course.html";
$url_2 = "http://www.handbook.unsw.edu.au/postgraduate/courses/2017/$course.html";
open F, "wget -q -O- $url_1|" or die;
@lines_1 = <F>;
close F;
open F, "wget -q -O- $url_2|" or die;
@lines_2 = <F>;
close F;
foreach $line (@lines_1){
        if($line =~ m/Prerequisite/){
                my @list = split /<p>/, $line;
                my $pre_1 = $list[1];
                $pre_1 =~ s/Prerequisite[s]*//g;
                $pre_1 =~ s/Corequisite[s]*//;
                $pre_1 =~ s/\.*<\/p>//;
                $pre_1 =~ s/[^A-Z0-9]/:/g;
                $pre_1 =~ s/:+/:/g;

                my @pre_1_list = split /:/, $pre_1;
                foreach (@pre_1_list){
                        push @result, $_ if ($_ and length($_) == 8);
                }

        }
}


foreach $line (@lines_2){
        if($line =~ m/Prerequisite/){
                my @list = split /<p>/, $line;
                my $pre_2 = $list[1];
                $pre_2 =~ s/Prerequisite[s]*//g;
                $pre_2 =~ s/Corequisite[s]*//g;
                $pre_2 =~ s/\.*<\/p>//;

                $pre_2 =~ s/[^A-Z0-9]/:/g;
                $pre_2 =~ s/:+/:/g;

                my @pre_2_list = split /:/, $pre_2;
                foreach (@pre_2_list){
                        push @result, $_ if($_ and length($_) == 8);
                }
        }
}

@result = sort @result;
@result = uniq @result;
}
@final_result = ();
sub recursive_get {
        my $first = $_[0];
        my @result = get_pre($first);
        if($#result + 1 <= 0){
                push @final_result, $first;
                return;
        }else{
                foreach(@result){
                        push @final_result, $_;
                        recursive_get($_);
                }
        }
}


if($ARGV[0] =~ m/^-r$/ and @ARGV == 2){

        recursive_get($ARGV[1]);

        @final_result = sort @final_result;
        @final_result = uniq @final_result;

        foreach(@final_result){
                print;
                print "\n";
        }

}else{
        my @non_recur_result = get_pre($ARGV[0]);
        foreach(@non_recur_result){
                print;
                print "\n";
        }
}


