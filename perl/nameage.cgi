#!/usr/bin/perl
# nameage.cgi

use CGI ':standard';

$name = param('yourname') || 'John Doe';
$age  = param('age')      || 0;

@params = param();

print
    header(),
    start_html('Your Name and Age'),
    "Hello $name, you are $age years old.",
    hr(),
    'The parameters entered are: ',
    b("@params"),
    end_html();
