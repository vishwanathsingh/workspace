#! /usr/bin/perl
# info3.cgi

use strict;
use CGI ':standard';

my $host = server_name();
my $date = localtime();

print
    header(),
    start_html(-title   => 'System Information',
	       -bgcolor => '#520063',
	       -text    => '#ffffff'),
    h1("Hello from $host!"),
    "The current time is now: $date",
    end_html();
