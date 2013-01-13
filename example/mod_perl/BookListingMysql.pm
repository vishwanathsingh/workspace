package BookListingMysql;
# file: BookListingMysql.pm

# use strict and necessary modules,
# including DBI
use strict;
use Apache::Constants ':common';
use Apache::Request;
use DBI;

####
#
# handle_error() - subroutine to handle any errors
#
####

sub handle_error {
    my $r     = shift;
    my $msg   = shift;
    my $dbh   = shift;
    my $sth   = shift;

    $r->print(<<EOHTML);
ERROR: <font color="#ff0000">$msg</font>
EOHTML

    print bottom_html();

    $sth->finish()     if $sth;
    $dbh->disconnect() if $dbh;

    return OK;
}

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
<a href="/booklistingmysql/"><font
color="#999966"><b>/booklistingmysql/</b></font></a>
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
    <tr><td><a href="/contents/wml/"><font
color="#999966"><b>Perl</b></font></a></td></tr>
    <tr><td><a href="/contents/mysql/"><font
color="#999966"><b>MySQL</b></font></a></td></tr>
    <tr><td><a href="/contents/cgi/"><font 
color="#999966"><b>WML</b></font></a></td></tr>
    <tr><td><a href="/contents/perl/"><font
color="#999966"><b>CGI</b></font></a></td></tr>
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
MySQL</b></font><br></p>
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

    # print the intitial HTML
    $r->print(top_html());

    # connect to the database, and if the connect fails,
    # call handle_error(), returning what it returns: OK
    my $dbh = DBI->connect('DBI:mysql:books', 'apache', 'LampIsCool')
            or return handle_error($r, 'Connecting to db failed.'. 
                                   DBI->errstr());

    # first, we need to get all the ISBN numbers so we can
    # grab our page of them -
    # prepare the SQL, handling the error if failure - we are
    # passing handle_error the variable $dbh so it can disconnect
    # from the database
    my $sth = $dbh->prepare('SELECT isbn FROM book_information 
                             ORDER BY isbn')
            or return handle_error($r, 'Prepare of SQL failed' . 
                                   $dbh->errstr(), $dbh);

    # execute the query, and it if fails, call handle_error() 
    # passing it $dbh and $sth
    $sth->execute()
            or return handle_error($r, 'Execute failed' . $sth->errstr(), 
                                    $dbh, $sth);

    # declare some variables
    my(@isbn) = ();
    my($isbn);
    
    # fetch each row
    while (($isbn) = $sth->fetchrow()) {
        push @isbn, $isbn;
    }

    # this code prints the navigation for all the pages
    # of book information - the HTML will resemble:
    #     1 | 2 | 3 | 4 | 5
    # if the user clicks on `3', they will go to the third
    # page of books
    my $bgcolor = '';
    for (my $i = 0; ($i+1)*$NUM_BOOKS <= $#isbn; $i++) {
        if ($i != 0) {
            $r->print(' | ');
        }
        if ($i * $NUM_BOOKS == $first_book) {
            $r->print($i + 1);
        } else {
            $r->print("<a href=\"/booklistingmysql?first=", 
                      $i*$NUM_BOOKS, "\"><font color=\"#999966\"><b>",
                      $i + 1, "</b></font></a>");
        }
    }
   
    # print the intial HTML for our table
    $r->print(<<EOHTML);
<table border="0" cellspacing="0" cellpadding="3">
<tr><th>Title</th><th>Author(s)</th><th>Price</th></tr>
EOHTML

    # this for loop loops through this page of book information -
    # if the user has asked for the 3rd page of books, we start
    # with book 30 (0-based) in @isbn and loop for 10 books
    for (my $i = $first_book; 
                $i < ($first_book + $NUM_BOOKS) and $i <= $#isbn; 
                      $i++) {

        # get this book's information based on the ISBN
        $sth = $dbh->prepare('SELECT title, author, price 
                              FROM book_information WHERE isbn = ?')
             or handle_error($r, 'Prepare of SQL failed' . $dbh->errstr(), 
                             $dbh);
        $sth->execute($isbn[$i])
             or handle_error($r, "</table>Execute failed: $isbn[$i]" . 
                             $dbh->errstr(), $dbh, $sth);

        # fetch the title, author, price from the row
        my($title, $author, $price) = $sth->fetchrow();

        # this sets the background color for the row -
        # even rows are grey-ish, odd rows are white -
        # this make reading easier
        if ($i % 2 == 0) {
            $bgcolor = '#DDDDDD';
        } else {
            $bgcolor = '#FFFFFF';
        }

        # print the HTML for the row
        $r->print(<<EOHTML);
<tr bgcolor="$bgcolor"><td valign="top"><i>
<a href="/bookdetailmysql?isbn=$isbn[$i]"><font
color="#999966"><b>$title</b></font></a></i></td>
<td>$author</td><td valign="top">\$$price</td></tr>
EOHTML
    }

    # print the end of the table of books
    $r->print("</table>");

    # print the last of the HTML
    $r->print(bottom_html());

    # finish, disconnect, return
    $sth->finish();
    $dbh->disconnect();

    return OK;
}

1;
