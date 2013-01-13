#!/usr/bin/perl -w
# connect.pl

use DBI;

use strict;

# declare some variables for later
my($ln, $fn, $age);

# connect
my $dbh = DBI->connect('DBI:mysql:people', 'apache', 'LampIsCool')
        or die "Can't connect: " . DBI->errstr();

# prepare the SQL to show the contents of the table before
# we insert
my $sth = $dbh->prepare('SELECT * FROM age_information')
        or die "Can't prepare SQL: " . $dbh->errstr();

$sth->execute()
        or die "Can't execute SQL: " . $sth->errstr();

# loop through contents after the insert
while (($ln, $fn, $age) = $sth->fetchrow()) {
    print "$fn $ln, $age\n";
}

# print a nice dashed line
print '-' x 40, "\n\n";

# now, prompt for and read in the data for the new record
print 'Enter last name: ';
chomp($ln = <STDIN>);
print 'Enter first name: ';
chomp($fn = <STDIN>);
print 'Enter age: ';
chomp($age = <STDIN>);

# prepare SQL for insert
$sth = $dbh->prepare('INSERT INTO age_information
                (
                    lastname,
                    firstname,
                    age
                )
		VALUES
                (
                    ?,
                    ?,
                    ?
                )') 
        or die "Can't prepare SQL: " . $dbh->errstr();

# insert the record - note the arguments to execute()
$sth->execute($ln, $fn, $age)
        or die "Can't execute SQL: " . $sth->errstr();

# print another dashed line
print "\n", '-' x 40, "\n\n";

# now show the contents of the table, including the
# new record
$sth = $dbh->prepare('SELECT * FROM age_information')
        or die "Can't prepare SQL: " . $dbh->errstr();

$sth->execute()
        or die "Can't execute SQL: " . $sth->errstr();

# loop through contents after the insert
while (($ln, $fn, $age) = $sth->fetchrow()) {
    print "$fn $ln, $age\n";
}

# finish and disconnect
$sth->finish();
$dbh->disconnect();
