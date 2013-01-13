package BookListing;
# file: BookListing.pm

use strict;
use Apache::Constants ':common';
use Apache::Request;

####
#
# top_html()
#
# a subroutine that will return the HTML for the top of 
# the page - this will create a look and feel like the
# rest of the website
#
####

sub top_html {
    return <<EOHTML;
<html>
<head>
<title>Open Source Web Book - Book Listing Information</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#333333" leftmargin="0" topmargin="0"
marginwidth="0" marginheight="0" link="#333333">
<table width="780" border="0" cellspacing="0" cellpadding="0">
<tr>
<td bgcolor="#000000" colspan="3" align="center"><font color="#FFFFFF">
www.opensourcewebbook.com
</font></td>
</tr>
<tr>
<td bgcolor="#999966" colspan="3">&nbsp;</td>
</tr>
<tr>
<td width="15">&nbsp;</td>
<td width="180">&nbsp;</td>
<td>&nbsp;</td>
</tr>
</table>
<table width="780" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="15">&nbsp;</td>
<td width="570"><font color="#FF0000"><b>Page Path -</b></font> 
<a href="/contents/"><font color="#999966"><b>Contents</b></font></a> -
<a href="/contents/mod_perl/"><font
color="#999966"><b>mod_perl</b></font></a> -
<a href="/booklisting/"><font color="#999966"><b>/booklisting/</b></font></a>
</td>
<td width="195"> 
<div align="center"><img src="/icons/logo.gif" width="177"
height="51"></div>
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
</table>
<table width="780" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="15">&nbsp;</td>
<td width="168" valign="top">


<table width="164" cellspacing="3" cellpadding="0">
<tr><td><a href="/"><font color="#999966"><b>Home</b></font></a></td></tr>
<tr><td><a href="/about/"><font 
color="#999966"><b>About</b></font></a></td></tr>
<tr><td><a href="/foreword/"><font
color="#999966"><b>Foreword</b></font></a></td></tr>
<tr><td><a href="/reviews/"><font
color="#999966"><b>Reviews</b></font></a></td></tr>
<tr><td><a href="/authors/"><font
color="#999966"><b>Authors</b></font></a></td></tr>
<tr><td><a href="/purchase/"><font
color="#999966"><b>Purchase</b></font></a></td></tr>
<tr><td><a href="/errata/"><font
color="#999966"><b>Errata</b></font></a></td></tr>
<tr><td><a href="/sourcecode/"><font
color="#999966"><b>Sourcecode</b></font></a></td></tr>
<tr><td><a href="/resources/"><font
color="#999966"><b>Resources</b></font></a></td></tr>
<tr><td><a href="/tools/"><font
color="#999966"><b>Tools</b></font></a></td></tr>
<tr><td><a href="/contents/"><font
color="#999966"><b>Contents</b></font></a></td></tr>
<tr><td>
  <table width="130" cellspacing="3" cellpadding="0" align="right">
    <tr><td><a href="/contents/linux/"><font
color="#999966"><b>Linux</b></font></a></td></tr>
    <tr><td><a href="/contents/apache/"><font
color="#999966"><b>Apache</b></font></a></td></tr>
    <tr><td><a href="/contents/perl/"><font
color="#999966"><b>Perl</b></font></a></td></tr>
    <tr><td><a href="/contents/mysql/"><font
color="#999966"><b>MySQL</b></font></a></td></tr>
    <tr><td><a href="/contents/wml/"><font
color="#999966"><b>WML</b></font></a></td></tr>
    <tr><td><a href="/contents/cgi/"><font color="#999966"><b>CGI
</b></font></a></td></tr>
    <tr><td><a href="/contents/mod_perl/"><font
color="#999966"><b>mod_perl</b></font></a></td></tr>
    <tr><td><a href="/contents/ssi/"><font
color="#999966"><b>SSI</b></font></a></td></tr>
    <tr><td><a href="/contents/embperl/"><font
color="#999966"><b>Embperl</b></font></a></td></tr>
    <tr><td><a href="/contents/mason/"><font
color="#999966"><b>Mason</b></font></a></td></tr>
    <tr><td><a href="/contents/php/"><font
color="#999966"><b>PHP</b></font></a></td></tr>
  </table>
</td></tr>
</table>
</td>
<td width="10">&nbsp;</td>
<td width="2" bgcolor="#999966">&nbsp;</td>
<td width="20">&nbsp;</td>
<td width="500" valign="top">
<p><font color="#FF0000"><b>Book Listing Built with 
mod_perl</b></font><br></p>
<p>Select a book and see its detail!</p>
<hr>
<p>&nbsp;</p>
EOHTML
}

####
#
# end of top_html()
#
####


####
#
# bottom_html()
#
# a subroutine that will return the HTML for the bottom of 
# the page 
#
####

sub bottom_html {
    return <<EOHTML;
</td>
<td width="65">&nbsp;</td>
</tr>
</table>
</body>
</html>
EOHTML
}


####
#
# end of bottom_html()
#
####


####
#
# handler()
#
####

sub handler {
    # shift the argument and pass it into 
    # the new() method in the Apache::Request
    # class
    my $r = new Apache::Request(shift);

    # set the number of books to 10, and
    # grab the value posted with 'first'
    # (defaulted to 0)
    my $NUM_BOOKS = 10;
    my $first_book = $r->param('first') || 0;

    # set the content type and send the header
    $r->content_type('text/html');
    $r->send_http_header();

    # open the data file - if the open() fails
    # and returns false, print an error message
    # to the browser and return OK
    unless (open FH, '/var/www/misc/book_data.txt') {
        $r->print(<<EOHTML);
<html>
<head>
<title>Book Listing Information Error</title>
</head>
<body bgcolor="#ffffff">
<h1>Error</h1>
Opening of /var/www/misc/book_data.txt failed.
</body>
</html>
EOHTML

        return OK;
    }

    # print the initial HTML
    $r->print(top_html());

    # if we get to here, our file was opened
    # successfully, so slurp it into @data
    # and close the file
    my @data = <FH>;
    close FH;

    # this for loop builds the navigation for
    # links to the previous and next pages  - it
    # will end up looking like:
    #    1 | 2 | 3 | 4 | 5
    for (my $i = 0; ($i+1)*$NUM_BOOKS < $#data; $i++) {
        if ($i != 0) {
            $r->print(' | ');
        }
        if ($i * $NUM_BOOKS == $first_book) {
            $r->print($i + 1);
        } else {
            $r->print("<a href=\"/booklisting?first=", 
                      $i*$NUM_BOOKS, "\"><font color=\"#999966\"><b>",$i + 1,
                      "</b></font></a>");
        }
    }
   
    # start the table
    $r->print(<<EOHTML);
<table border="0" cellspacing="0" cellpadding="3">
<tr><th>Title</th><th>Author(s)</th><th>Price</th></tr>
EOHTML

    # now build each row of the table - we loop
    # starting with the first book (passed through
    # the parameter 'first') for the number of books
    # (we set this to 10) - for each book, split
    # the data on the \t and store the result into
    # variables - then set the bgcolor: grey for
    # even records, white for odd records -
    # then print the HTML for the row
    my $bgcolor = '';
    for (my $i = $first_book; 
           $i < ($first_book + $NUM_BOOKS) and $i <= $#data; 
               $i++) {
	my(
	    $isbn, 
	    $author, 
	    $title, 
	    $publisher, 
	    $year, 
	    $desc, 
	    $price
	  ) = split /\t/, $data[$i];

	if ($i % 2 == 0) {
	    $bgcolor = '#DDDDDD';
	} else {
	    $bgcolor = '#FFFFFF';
	}
	$r->print(<<EOHTML);
<tr bgcolor="$bgcolor"><td valign="top"><i>
<a href="/bookdetail?isbn=$isbn"><font color="#999966"><b>$title</b>
</font></a></i>
</td><td>$author</td><td>$price</td></tr>
EOHTML
    }

    # print the bottom of the table
    $r->print(<<EOHTML);
</table>
EOHTML

    # print the bottom html
    $r->print(bottom_html());

    return OK;
}

####
#
# end of handler()
#
####

1;
