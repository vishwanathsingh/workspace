#!/usr/bin/perl -w
# book.pl

use strict;
use DBI;

# connect to the database
my $dbh = DBI->connect('DBI:mysql:books', 'apache', 'LampIsCool')
        or die "Can't connect: " . DBI->errstr();

# open the data file
open FH, '/var/www/misc/book_data.txt' or die $!;

# loop through each line of the file
my($line, $sth);
while ($line = <FH>) {

    chomp($line);

    # split the line into some variables
    my($isbn, $author, $title, $publisher, $date, 
       $description, $price) = split /\t/, $line;

    # remove the $ from $price
    $price =~ s/^\$//;

    # prepare SQL for insert
    $sth = $dbh->prepare('INSERT INTO book_information
                (
                    isbn,
                    author,
                    title,
                    publisher,
                    date,
                    description,
                    price
                )
                VALUES
                (
                    ?,
                    ?,
                    ?,
                    ?,
                    ?,
                    ?,
                    ?
                )') 
            or die "Can't prepare SQL: " . $dbh->errstr();

    # execute the query, passing the variable values so they
    # can fill the ? placeholders in the query
    $sth->execute($isbn, $author, $title, $publisher, $date, 
                  $description, $price)
            or die "Can't execute SQL: " . $sth->errstr();

}

# close the file, finish and disconnect
close FH;

$sth->finish();
$dbh->disconnect();
