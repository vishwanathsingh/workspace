#! /usr/bin/perl -w
# file: array1.pl
 
use strict;

my @data = ('Joe', 39, 'Test data', 49.3);
 
print "Within double quotes: @data\n";
print "Outside any quotes: ", @data, "\n";
print 'Within single quotes: @data', "\n";
