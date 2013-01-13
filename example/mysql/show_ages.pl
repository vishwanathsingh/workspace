#!/usr/bin/perl -w
# show_ages.pl

use DBI;

use strict;

# connect to the server, and if connect returns false,
# die() with the DBI error string
my $dbh = DBI->connect('DBI:mysql:people', 'apache', 'LampIsCool')
        or die "Can't connect: " . DBI->errstr();

# prepare the SQL, die() if the preparation fails
my $sth = $dbh->prepare('SELECT * FROM age_information')
        or die "Can't prepare SQL: " . $dbh->errstr();

# execute the SQL, die() if it fails
$sth->execute()
        or die "Can't execute SQL: " . $sth->errstr();

# loop through each record of our table,
# $sth->fetchrow() returns the next row,
# and we store the values in $ln, $fn and $age 
my($ln, $fn, $age);
while (($ln, $fn, $age) = $sth->fetchrow()) {
    print "$fn $ln, $age\n";
}

# finish the state handle, disconnect from the server
$sth->finish();
$dbh->disconnect();
