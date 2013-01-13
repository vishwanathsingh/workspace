#!/usr/bin/perl -w
# connect.pl

# use the DBI module
use DBI;

# use strict, it is a Good Idea
use strict;

# connect to the database, assigning the result to $dbh
my $dbh = DBI->connect('DBI:mysql:people', 'apache', 'LampIsCool');

# die if we failed to connect
die "Can't connect: " . DBI->errstr() unless $dbh;

# all is well!
print "Success: connected!\n";

# disconnect from the MySQL server
$dbh->disconnect();
