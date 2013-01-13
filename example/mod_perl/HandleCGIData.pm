package HandleCGIData;
# file: HandleCGIData.pm

use strict;
use Apache::Constants ':common';

sub handler {
    # shift the argument into $r
    my $r = shift;
    
    # initialize %params, the assign
    # it the form data depending on
    # the method used
    my %params = ();
    if ($r->method() eq 'POST') {
	%params = $r->content();
    } else {
	%params = $r->args();
    }

    # set the content type and send the 
    # header
    $r->content_type('text/html');
    $r->send_http_header();

    # print intial HTML
    $r->print(<<EOHTML);
<html>
<head>
<title>Processing CGI Parameters</title>
</head>
<body bgcolor="#ffffff">
<h1>Processing CGI Parameters</h1>
EOHTML

    # loop through the sorted keys of
    # %params, printing the key (form
    # widget name) followed by the
    # value (form widget value)
    foreach my $key (sort keys %params) {
	print "$key: <b>$params{$key}</b><br>";
    }

    # print the final HTML, return OK
    $r->print(<<EOHTML);
</body>
</html>
EOHTML

    return OK;
}

1;
