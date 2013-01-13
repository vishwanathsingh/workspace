#!/usr/bin/perl 
# info2.cgi


chomp($host = `/bin/hostname`);
chomp($date = `/bin/date`);


print <<EOHTML;
Content-type: text/html

<html>
<head>
<title>System Information</title>
</head>
<body bgcolor="#520063" text="#ffffff">
<h1>Hello from www.opensourcewebbook.com!</h1>
The current time is now: $date
</body>
</html>
EOHTML
