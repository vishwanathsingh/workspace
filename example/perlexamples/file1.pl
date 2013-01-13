#! /usr/bin/perl -w
# file: file1.pl

use strict;

my $line;
 
open FH, '<test.txt' or die "Can't open test.txt: $!";
 
while ($line = <FH>) {
    print "Line is: $line";
}
 
close FH;
