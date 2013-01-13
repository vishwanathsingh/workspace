#!/usr/bin/perl -w
# file: memory2.pl

use strict;

# create a record, 3 fields, colon-separated
my $record = '32451:John Doe:847 555 1212';

# see if the record contains:
#  begin the string
#  followed by 0 or more of any character but \n
#    (remembered into $1)
#  followed by a colon (`:')
#  followed by 0 or more of any character but \n
#    (remembered into $2)
#  followed by a colon (`:')
#  followed by 0 or more of any character but \n
#    (remembered into $3)
#  followed by the end of the string
if ($record =~ /^(.*):(.*):(.*)$/) {
    print "The record is:\n";
    print "    account number: $1\n";
    print "    name:           $2\n";
    print "    phone number:   $3\n";
}


