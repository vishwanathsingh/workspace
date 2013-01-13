#! /usr/bin/perl -w
# file: pushpop.pl

use strict;

my @a = (2, 4, 6, 8);
print "before: @a\n";

push(@a, 10, 12);
print "after push: @a\n";

my $element = pop(@a);
print "after pop: @a\n";
print "element popped: $element\n";
