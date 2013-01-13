#! /usr/bin/perl -w
# file: sortreverse.pl

use strict;

my @a = ('hello', 'world', 'good', 'riddance');
print "before: @a\n";

my @b = sort(@a);
print "sorted: @b\n";

@b = reverse(@a);
print "reversed: @b\n";
