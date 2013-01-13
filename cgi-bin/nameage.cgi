#!/usr/bin/perl
# nameage.cgi

use strict;
use CGI ':standard';

my $name   = param('yourname') || 'John Doe';
my $age    = param('age')      || 0;
my @params = param();

print
    header(),
    start_html('Your Name and Age'),
    "Hello $name, you are $age years old.",
    hr(),
    'The parameters entered are: ',
    b("@params"),
    end_html();
