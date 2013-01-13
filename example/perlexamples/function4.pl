#!/usr/bin/perl -w
# file: function4.pl

use strict;

sub munge_phone {
    my($phone) = @_;

    # check to see that the phone number is
    # in the form 847 555 1212
    if ($phone =~ /(\d{3})\s(\d{3})\s(\d{4})/) {
        return "($1) $2-$3";
    } else {
        return 'Phone improperly formed';
    }
}

sub matches_class {
    my($str, $char_class) = @_;

    if ($str =~ /^[$char_class]+$/) {
        print "[$str] matches /[$char_class]/\n";
    } else {
        print "[$str] does not match /[$char_class]/\n";
    }
}

# let's try a properly formed phone number
my $p1 = 'phone number: 847 555 1212';
my $p2 = munge_phone($p1);
print "before: $p1   after: $p2\n";

# now let's try an improperly formed phone number
my $p3 = '847 555-1212';
my $p4 = munge_phone($p2);
print "before: $p3   after: $p4\n";

# let's check some strings against a classdn
my $s1 = 'A string of only alphas and space';
my $s2 = 'A string with 1 digit';
my $c  = 'a-zA-Z ';
matches_class($s1, $c);
matches_class($s2, $c);
