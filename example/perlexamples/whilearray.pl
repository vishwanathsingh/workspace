#! /usr/bin/perl -w
# file: whilearray.pl
 
use strict;

my @names = ('Joe', 'Charlie', 'Sue', 'Mary');
my $i = 0;
while ($i <= $#names) {
    print "Element $i is $names[$i]\n";
    $i++;
}
