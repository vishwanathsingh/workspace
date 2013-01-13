#!/usr/bin/perl 
# info2.cgi


chomp($host = `/bin/hostname`)
chomp($date = `/bin/date`);


print <<EOHTML;
Content-type: text/html

<html>
<head>
<title>System Information</title>
</head>
<body bgcolor="#660099" text="#ffffff">
<h1>Hello from $host!</h1>
The current time is now: $date
</body>
</html>
EOHTML
