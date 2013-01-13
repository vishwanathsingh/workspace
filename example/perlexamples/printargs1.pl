#! /usr/bin/perl -w
# file: printargs1.pl
 
use strict;

sub print_args {
    my $i = 0;
 
    # loop through @_ and print each element
    # and yes, that is $#_, the last index of @_
    while ($i <= $#_) {
        print "arg $i: $_[$i]\n";
        $i++;
    }
}
 
# some variables to pass in
my $num = 10;
my $name = 'Joe';
 
print_args($num, $name, 3.14159, 'hello, world!');
