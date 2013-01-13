#!/usr/bin/perl 
# simple.cgi

use CGI ':standard';

print
    header(),
    start_html(-title   => 'A Simple Page',
               -bgcolor => '#ffffff',
               -text    => '#520063'),
    h1('Hello, world! again'),
    hr(),
    'Time to go now...',
    end_html();
