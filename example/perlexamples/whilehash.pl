#! /usr/bin/perl -w
# file: whilehash.pl
 
use strict;

my %capitals = (
    Illinois   => 'Springfield',
    California => 'Sacramento',
    Texas      => 'Austin',
    Wisconsin  => 'Madison',
    Michigan   => 'Lansing'
);
 
my @sk = sort(keys(%capitals));
 
my $i = 0;
while ($i <= $#sk) {
    print "$sk[$i]:  \t$capitals{$sk[$i]}\n";
    $i++;
}
