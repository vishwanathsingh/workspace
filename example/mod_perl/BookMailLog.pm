package BookMailLog;
# file: BookMailLog.pm

use strict;
use Apache::Constants ':common';

sub handler {
    # shift the argument into $r
    my $r = shift;

    # get the date/time
    my $date         = localtime();

    # get some of the request information
    # including the remote host, the URI,
    # the query string and the number of
    # bytes sent to the mod_perl program
    my $remote_host  = $r->get_remote_host();
    my $uri          = $r->uri();
    my $query_string = $r->query_string();
    my $num_bytes    = $r->bytes_sent();
    
    # check for nastyness - first, is
    # the query string too big?
    if (length($query_string) > 100) {
        return OK;
    }

    # now check to see if the query string
    # contains anything besides word characters
    # ([a-zA-Z0-9_]) or the equal sign (=)
    unless ($query_string =~ /^[\w=]+$/) {
        return OK;
    }

    # ok so far, so open a pipe to sendmail,
    # and if it opens ok, send text into it -
    # this text will be an email message 
    if (open SM, '| /usr/sbin/sendmail -t -oi') {
        print SM <<EOM;
From: mod_perl email log <log\@localhost.com>
To: log_notification\@localhost.com
Subject: Book Listing/Detail was accessed

Time:              $date
Remote host:       $remote_host
Requested URI:     $uri
Query string:      $query_string
Bytes transferred: $num_bytes



EOM

        close SM;
    }

    return OK;
}

1;
