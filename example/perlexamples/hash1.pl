#! /usr/bin/perl -w
# file: hash1.pl

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

print "$person{name} lives in $person{state}\n";
print "$person{name} is $person{age} years old\n";
