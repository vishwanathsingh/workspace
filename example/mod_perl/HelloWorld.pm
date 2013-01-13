package HelloWorld;
# file: HelloWorld.pm

use strict;
use Apache::Constants ':common';

# the handler() method
sub handler {
    # shift the argument into $r
    my $r = shift;

    # set the content type and send the header
    $r->content_type('text/html');
    $r->send_http_header();

    # print the HTML to say hello
    $r->print(<<EOHTML);
<html>
<head>
<title>hello, world with mod_perl</title>
</head>
<body bgcolor="#ffffff">
<h1>hello, world!</h1>
hello, world! with mod_perl
</body>
</html>
EOHTML

    # return OK to Apache so that it knows
    # to continue as normal
    return OK;
}

1;
