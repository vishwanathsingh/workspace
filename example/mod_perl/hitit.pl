#!/usr/bin/perl -w

use LWP::Simple;

# the URLs to request
$CGIURL     = 'http://localhost/cgi-bin/hello.cgi';
$MODPERLURL = 'http://localhost/perl/hello.cgi';

# initialize to empty string
$content    = '';

# the time() function returns the number of seconds
# since January 1, 1970
$start_time = time();
print "Start CGI: ", $start_time, "\n";
# loop 1000 times
foreach (1..1000) {
    unless (defined ($content = get($CGIURL))) {
        die "could not get $CGIURL\n";
    }
}
$end_time = time();
print "End CGI: ", $end_time, "\n";
print "CGI difference: ", $end_time - $start_time, "\n";

$start_time = time();
print "Start mod_perl: ", $start_time, "\n";
foreach (1..1000) {
    unless (defined ($content = get($MODPERLURL))) {
        die "could not get $MODPERLURL\n";
    }
}
$end_time = time();
print "End mod_perl: ", $end_time, "\n";
print "mod_perl difference: ", $end_time - $start_time, "\n";

