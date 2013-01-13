#!/usr/bin/perl 
# info.cgi

chomp($host = `/bin/hostname`);
chomp($date = `/bin/date`);

print "Content-type: text/html\n";
print "\n";

print "<html>\n";
print "<head>\n";
print "<title>System Information</title>\n";
print "</head>\n";
print "<body bgcolor=\"#660099\" text=\"#ffffff\">\n";
print "<h1>Hello from $host!</h1>\n";
print "The current time is now: $date\n";
print "</body>\n";
print "</html>\n";

