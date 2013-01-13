#! /usr/bin/perl -w
# stdin3.pl
 
use strict;

print "Enter your text: \n";
 
my @all_lines = <STDIN>;
 
my $i = 0;
while ($i <= $#all_lines) {
    print "line $i: $all_lines[$i]";
    $i++;
}
