package HandleCGIData2;
# file: HandleCGIData2.pm

# use statments, including
# our new Apache::Request module
use strict;
use Apache::Constants ':common';
use Apache::Request;

sub handler {
    # shift the argument and pass it into
    # the new() method in the Apache::Request
    # class
    my $r = Apache::Request->new(shift);

    # we can now call param() with the Apache::Request
    # object in a similar way to using CGI.pm
    my $name = $r->param('name') || 'John Doe';
    my $age  = $r->param('age')  || 50;

    # set the content type and send the header
    $r->content_type('text/html');
    $r->send_http_header();

    # print the HTML, including our variables
    # $name and $age
    $r->print(<<EOHTML);
<html>
<head>
<title>Using Apache::Request</title>
</head>
<body bgcolor="#ffffff">
<h1>Using Apache::Request</h1>
name = $name<br>
age = $age
</body>
</html>
EOHTML

    return OK;
}

1;
