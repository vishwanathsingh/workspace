#!/usr/bin/perl -w
# file: memory1.pl

use strict;

my $name = 'John Doe';

if ($name =~ /^(..)/) {
    print "^(..)   :  $1\n";
}

if ($name =~ /^(\w+)/) {
    print "^(\\w+)  :  $1\n";
}

if ($name =~ /(\w+)$/) {
    print "(\\w+)\$  :  $1\n";
}

