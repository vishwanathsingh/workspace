#! /usr/bin/perl -w
# file3.pl

use strict;

my $line;
 
open FH, '>output.txt' or die "Can't open output.txt: $!";
 
while ($line = <STDIN>) {
    print FH "You entered: $line";
}
 
close FH;
