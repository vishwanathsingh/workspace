#!/usr/bin/perl -w
# file: return2.pl

sub pick_a_restaurant {
    if ($cash > 150.00) {
        return 'Chez Paul de Francais';
    } elsif ($cash > 50.00) {
        return 'A-1 Steak House';
    } elsif ($cash > 10.00) {
        return "Pancakes 'R' Us";
    } else {
        return 'Fast Food Delight';
    }
}

# we are a little light today...
$cash = 10.00;

print 'You should eat at: ', pick_a_restaurant(), "\n";
