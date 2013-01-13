#! /usr/bin/perl -w
# file:  hash3.pl

use strict;
 
my %person = (
    name    => 'Joe',
    age     => 39,
    phone   => '555-1212',
    address => '123 Main St.',
    city    => 'Chicago',
    state   => 'IL',
    zip     => '60601'
);
 
my @k = keys(%person);
my @sk = sort(@k);
# or: @sk = sort(keys(%person));
 
print "The sorted keys are: @sk\n";
