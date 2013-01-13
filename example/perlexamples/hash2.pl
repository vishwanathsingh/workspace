#! /usr/bin/perl -w
# file: hash2.pl
 
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
 
print "The keys are: @k\n";
