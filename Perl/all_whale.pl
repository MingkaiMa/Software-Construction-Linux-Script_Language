#Write a Perl script all_whales.pl that reads whale 
#obsevatiions in the above format until the end-of-input is 
#reached and for all species of whale observed prints 
#the number of pods of the specified whale and the total numbers of whales in those pods.

#!/usr/bin/perl -w

chomp(@lines = <STDIN>);

foreach $var (@lines){
        if($var =~ m/^\s*$/){
                next;
        }
        $var =~ tr/[A-Z]/[a-z]/;
        my $old_whale = $var;
        $var =~ s/^[0-9 ]+ //i;
        if($var =~ m/s$/){
                $var =~ s/s$//;
        }
        $var =~ s/\s+/ /;
        $var =~ s/\s*$//;
#       print "--whale name is: $var\n";
        $old_whale =~ s/[^0-9]//gi;
#       print "++whale name indi nb is : $old_whale\n";
        if(exists($data{$var})){
                $data{$var}[0]++;
                $data{$var}[1] += $old_whale;
        }else{
                $data{$var}[0] = 1;
                $data{$var}[1] = $old_whale;
        }
}


@whale_names = keys %data;
@whale_names = sort @whale_names;
foreach $name (@whale_names){
        print "$name observations: $data{$name}[0] pods, $data{$name}[1] individuals\n";
}
