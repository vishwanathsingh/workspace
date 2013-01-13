# file: /var/www/lib/embperl_template.pl
 
##
## the subroutine to return the HTML for the top
## of the page
##
 
sub top {
    return <<EOHTML;
<html> 
<head>
<title>Embperl Project Take 1</title>
</head> 
<body bgcolor="#ffffff">
<h1>A First Stab at Our Embperl Project</h1>
EOHTML
}
 
 
##
## the subroutine to return the HTML for the
## bottom of the page
##
 
sub bottom {
    return <<EOHTML;
</body>
</html>
EOHTML
}
 
1;   # don't forget this line!
