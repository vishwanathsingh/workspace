#! /usr/bin/perl -w
# file: function3.pl
 
use strict;

sub print_my_i {
    my $i = 10;
    print "in print_my_i(): $i\n";
}
 
my $i = 20;
 
print "outside print_my_i(): $i\n";
print_my_i();
print "outside print_my_i(): $i\n";
