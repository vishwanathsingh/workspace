#! /usr/bin/perl -w
# file: increment.pl
 
use strict;

my $i = 10;
my $j = ++$i;
print "\$i = $i, \$j = $j\n";
 
$i = 10;
$j = $i++;
print "\$i = $i, \$j = $j\n";
