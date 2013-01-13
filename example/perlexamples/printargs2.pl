#! /usr/bin/perl -w
# file: printargs2.pl
 
use strict;

sub print_args_2 {
 
    # copy the arguments into $a, $b and $c
    my($a, $b, $c) = @_;
 
    # print the arguments
    print "\$a is: $a\n";
    print "\$b is: $b\n";
    print "\$c is: $c\n";
}
 
my $num = 10;
my $name = 'Joe';
 
print_args_2($num, $name, 3.14159);
