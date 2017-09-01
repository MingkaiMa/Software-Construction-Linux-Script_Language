#Write a Perl script to implement the Unix tail command. It should support the following features of tail:
#read from files supplied as command line arguments
#read from standard input if no file name arguments are supplied
#display the error message tail.pl: can't open FileName for any unreadable file
#display the last N lines of each file (default N = 10)
#can adjust the number of lines displayed via an optional first argument -N
#if there is more than one named file, separate each by ==> FileName <==

#!/usr/bin/perl -w

$n = 10;
#print @ARGV;
foreach $arg(@ARGV){
        if ($arg eq "--version"){
                print "$0: version 0.1\n";
                exit 0;
        }
        elsif($arg =~ /-\d+/){
                $n = $arg;
                $n =~ s/-*//;
                #print "number is $n\n";
        }
        else{
                push @files, $arg;
        }

}

if ($#files + 1 == 0){
        while ($new = <STDIN>){
                push @lines, $new;
        }
        $start = 0;
        if ($n >= $#lines + 1){
                $start = 0;
        }
        else{
                $start = $#lines - $n + 1;
        }
        while ($start <= $#lines){
                print $lines[$start];
                $start++;
        }

        exit 0;
}


foreach $f (@files){
        open F, '<', $f or die "$0: Can't open $f: $!\n";
        if($#files + 1 > 1){
                #print "-----more than one need to display\n";
                print "==> $f <==\n";
        }
        @lines = <F>;
        $start = 0;
        if ($n >= $#lines + 1){
                $start = 0;
        }
        else{
                $start = $#lines - $n + 1;
        }
        while ($start <= $#lines){
                print $lines[$start];
                $start++;
        }

}
