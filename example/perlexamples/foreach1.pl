#! /usr/bin/perl -w
# file: foreach1.pl
 
use strict;

my @a = (2, 4, 6, 8);
foreach my $i (@a) {
    print $i, ' ** ', $i, ' = ', $i ** $i, "\n";
}
