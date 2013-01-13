#!/usr/bin/perl 
# info.cgi

# get the info from the system
chomp($host = `/bin/hostname`);
chomp($date = `/bin/date`);

# Pass info about the following text in the header
print "Content-type: text/html\n";
print "\n";

# Print the information in HTML on the web page
print "<html>\n";
print "<head>\n";
print "<title>System Information</title>\n";
print "</head>\n";
print "<body bgcolor=\"#520063\" text=\"#ffffff\">\n";
print "<h1>Hello from www.opensourcewebbook.com!</h1>\n";
print "The current time is now: $date\n";
print "</body>\n";
print "</html>\n";

