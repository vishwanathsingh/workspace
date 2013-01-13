#! /usr/bin/perl -w
# file2.pl

use strict;
 
open FH, '<test.txt' or die "Can't open test.txt: $!";
 
my @all_lines = <FH>;
 
my $i = 0;
while ($i <= $#all_lines) {
    print "Line is: $all_lines[$i]";
    $i++;
}
close FH;
