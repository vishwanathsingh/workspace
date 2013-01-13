#!/usr/bin/perl 

use LWP::Simple;
use Benchmark;

# the URLs to request
$CGIURL     = 'http://localhost/cgi-bin/hello.cgi';
$MODPERLURL = 'http://localhost/perl/hello.cgi';

timethese(1000, {
        CGI     => q{ $content = get($CGIURL); },
        MODPERL => q{ $content = get($MODPERLURL); },
    }
);
