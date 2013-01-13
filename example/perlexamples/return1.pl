#!/usr/bin/perl -w
# file: return1.pl

sub test1 {
    $a = 10;
    $b = 11;

    # return the sum
    $a + $b;
}

sub test2 {
    @a = ('testing', 'one', 'two', 'three');

    # return the sort of @a
    sort(@a);
}

$c = test1();
print "\$c = $c\n";

@b = test2();
print "\@b = @b\n";
