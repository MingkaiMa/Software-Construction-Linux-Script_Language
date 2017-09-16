#!/usr/bin/perl -w

%data = ();
$n = 0;

while($line = <STDIN>){
	$n++;
	$line =~ tr/A-Z/a-z/;
	$line =~ s/^ *//;
	$line =~ s/\s+/ /g;
	if(exists($data{$line})){
		$data{$line}++;			
	}else{
		$data{$line} = 1;
	}

	@length = keys %data;
	#print "size is : @length\n";
	if(@length == $ARGV[0]){
		print "$ARGV[0] distinct lines seen after $n lines read.\n";
		exit 0;
	}

}

print "End of input reached after $n lines read - $ARGV[0] different lines not seen.\n";
