#!/usr/bin/perl -w
##Writted by Mingkai_Ma
use List::Util qw[min max];
use List::MoreUtils qw{any};

$debug_flag = 0;

foreach $song_file(@ARGV){
	if($song_file =~ m/^-d$/){
		$debug_flag = 1;
		next;
	}
	open F, '<', $song_file or die;
	@words_list = ();
	foreach $line(<F>){
		@lst = split /[^a-zA-Z]/, $line;
		foreach $var(@lst){
			if($var =~ m/^[a-zA-Z]+$/){
				$var =~ tr/A-Z/a-z/;
				push @words_list, $var;
			}
		}
	}
	close F;
	
	my %s = ();
	foreach $file(glob "lyrics/*.txt"){
		my %song_in_artist = ();
		my $total_words = 0;
		open F, '<', $file or die;
		my @lines = <F>;
		close F;
		foreach $line(@lines){
			@lst = split /[^a-zA-Z]/, $line;
			foreach $var(@lst){
				if($var =~ m/^[a-zA-Z]+$/){
					$total_words++;
				}
				$var =~ tr/A-Z/a-z/;
				if(any{$_ eq $var} @words_list){
					$song_in_artist{$var}++;
				}
			}
		}
		#print "$file total words: $total_words\n";
		#print "$file\n";
		#foreach(keys %song_in_artist){
	#		print "word: $_ numbers: $song_in_artist{$_}\n";
	#	}


		my $sum_of_logpro = 0;
		foreach $word (@words_list){
			if(exists($song_in_artist{$word})){
				$sum_of_logpro += log(($song_in_artist{$word} + 1) / $total_words);
			}else{
				$sum_of_logpro += log((0 + 1) / $total_words);
			}		
		}
		$s{$sum_of_logpro} = $file;
	}	
	
	
	@list_of_logpro = keys %s;
	my $max_logpro = max(@list_of_logpro);
	my $print_file = $s{$max_logpro};
	$print_file =~ s/.*\///;
	$print_file =~ s/\.txt//;
	$print_file =~ s/[^a-zA-Z]/ /g;
	if($debug_flag == 1){
		@list_of_logpro = sort @list_of_logpro;
		#@list_of_logpro = reverse @list_of_logpro;
		foreach $var (@list_of_logpro){
			my $print_file_in = $s{$var};
        		$print_file_in =~ s/.*\///;
        		$print_file_in =~ s/\.txt//;
        		$print_file_in =~ s/[^a-zA-Z]/ /g;
			printf "%s: log_probability of %4.1f for %s", $song_file, $var, $print_file_in;
			print "\n";
		}		
	}
	printf "$song_file most resembles the work of %s (log-probability=%4.1f)", $print_file, $max_logpro;
	print "\n";		
}

