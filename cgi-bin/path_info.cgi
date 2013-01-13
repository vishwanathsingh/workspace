#! /usr/bin/perl
# path_info.cgi

use strict;
use CGI ':standard';

# get the path from %ENV, then from the
# CGI method path_info()
my $env_path    = $ENV{PATH_INFO} || '';
my $method_path = path_info()     || '';

print
    header,
    start_html(-title => 'Path Information',
               -bgcolor => '#ffffff'),
    'From %ENV: ',
    b($env_path),
    br(),
    'From path_info(): ',
    b($method_path),
    end_html();
