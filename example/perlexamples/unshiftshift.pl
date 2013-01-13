#! /usr/bin/perl -w
# file: unshiftshift.pl

use strict;

my @a = (2, 4, 6, 8);
print "before: @a\n";

unshift(@a, 10, 12);
print "after unshift: @a\n";

my $element = shift(@a);
print "after shift: @a\n";
print "element shifted: $element\n";
