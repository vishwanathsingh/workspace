#! /usr/bin/perl

# tell Perl where to find our modules
use lib '/var/www/mod_perl';
 
# use some common modules
use Apache::Registry();
use Apache::Constants();
use CGI ':standard';
use DBI;
 
# add other modules here...
 
# the file needs to end with 1;
1;
