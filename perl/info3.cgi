#! /usr/bin/perl
# info3.cgi

use CGI ':standard';

$host = server_name();
$date = localtime();

print
    header(),
    start_html(-title   => 'System Information',
	       -bgcolor => '#660099',
	       -text    => '#ffffff'),
    h1("Hello from $host!"),
    "The current time is now: $date",
    end_html();
