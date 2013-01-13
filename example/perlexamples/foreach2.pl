#!/usr/bin/perl -w
# file: foreach2.pl
 
use strict;

my @a = (2, 4, 6, 8);
foreach my $i (@a) {
    $i = $i * 2;
}
print "@a\n";
