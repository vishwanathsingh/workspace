#! /usr/bin/perl -w
# file: stdin2.pl
 
use strict;

my $name;

print "Enter your name: ";
 
chomp($name = <STDIN>);
 
print "Hello $name!\n";
