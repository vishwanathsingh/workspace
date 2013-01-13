package PathInfo;
# file: PathInfo.pm

use strict;
use Apache::Constants ':common';

sub handler {
    # the argument into $r
    my $r = shift;

    # call the path_info() method to get
    # the path information
    my $path_info = $r->path_info();

    # set the content type and send the header
    $r->content_type('text/html');
    $r->send_http_header();

    # print the HTML
    $r->print(<<EOHTML);
<html>
<head>
<title>Path Information with mod_perl</title>
</head>
<body bgcolor="#ffffff">
<h1>Path Information with mod_perl</h1>
We were passed this path information: <b>$path_info</b>
</body>
</html>
EOHTML

    return OK;
}

1;
