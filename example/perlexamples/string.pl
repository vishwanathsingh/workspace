#!/usr/bin/perl -w
# file: string.pl

use strict;

my $a = 'hello';
my $b = 'world';
my $msg = $a . ' ' . $b;

print "\$msg : $msg\n";

$a = 'hi';
$b = $a x 2;
my $c = $a x 5;

print "\$b : $b\n";
print "\$c : $c\n";
