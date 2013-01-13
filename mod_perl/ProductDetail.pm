package ProductDetail;
# ProductDetail.pm

# use strict and necessary modules,
# including DBI
use strict;
use Apache::Constants ':common';
use Apache::Request;
use DBI;
 
# subroutine to handle any errors
sub handle_error {
    my $r     = shift;
    my $msg   = shift;
    my $dbh   = shift;
    my $sth   = shift;
 
    $r->print(<<EOHTML);
ERROR: <font color="#ff0000"An error occurred: <b>$msg</b></font>
EOHTML

    $r->print(bottom_html());
 
    $sth->finish()     if $sth;
    $dbh->disconnect() if $dbh;
 
    return OK;
}
 
sub top_html {
    return <<EOHTML;
<html>
<head>
<title>Open Source Web Book - Product Detail</title>
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
<td width="570"><font color="#FF0000"><b>Page Path -</b></font> <font
color="#333333">Chapter 8:</font> <a href="/contents/mysql/"><font
color="#999966"><b>MySQL</b></font></a> &gt; <a
href="/productdetail/"><font color="#999966"><b>/productdetail/</b></font></a>
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
    <tr><td><a href="/contents/wml/"><font
color="#999966"><b>WML</b></font></a></td></tr>
    <tr><td><a href="/contents/perl/"><font
color="#999966"><b>Perl</b></font></a></td></tr>
    <tr><td><a href="/contents/cgi/"><font color="#999966"><b>CGI and
SSI</b></font></a></td></tr>
    <tr><td><a href="/contents/mysql/"><font
color="#999966"><b>MySQL</b></font></a></td></tr>
    <tr><td><a href="/contents/mod_perl/"><font
color="#999966"><b>mod_perl</b></font></a></td></tr>
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
<p><font color="#FF0000"><b>Product Detail Built with 
MySQL</b></font><br></p>
<p>This is the product detail for the MySQL project.
<hr>
<p></p>
EOHTML
}

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

sub handler {
    # get the request object
    my $r = new Apache::Request(shift);

    # get the posted form data
    my $posted_prod_id = $r->param('prod_id') || '';
    
    # make sure that the posted data contains the data we want
    # (no nasty characters) and the length we expect - if the
    # data looks bad, set the variable to empty string
    unless ($posted_prod_id =~ /^[\w]+$/) {
        $posted_prod_id = '';
    }
    if (length($posted_prod_id) > 4) {
        $posted_prod_id = '';
    }

    # set the content type and send the header
    $r->content_type('text/html');
    $r->send_http_header();

    $r->print(top_html());

    if ($posted_prod_id) {

        my $dbh = DBI->connect('DBI:mysql:product_database','apache','LampIsCool') 
                or return handle_error($r, DBI->errstr());

        my $sth = $dbh->prepare('SELECT products.name, products.category,
                                        products.description,products.price,
                                        manufacturers.name,
                                        manufacturers.address,
                                        manufacturers.city,
                                        manufacturers.state,
                                        manufacturers.zip,
                                        manufacturers.man_id
                              FROM manufacturers, products 
                              WHERE manufacturers.man_id = products.man_id
                                    AND products.prod_id = ?
                              ORDER BY products.category, products.name')
                or return handle_error($r, $dbh->errstr(), $dbh);

        $sth->execute($posted_prod_id) 
                or return handle_error($r, $sth->errstr(), $dbh, $sth);

        my($name,$category,$description,$price,$man_name,
           $address,$city,$state,$zip,$man_id) = $sth->fetchrow();

        if (defined($name)) {
            $r->print(<<EOHTML);
<font color="#ff0000"><b>Product: $posted_prod_id</b></font><br>
<table border="0" cellspacing="0" cellpadding="0">
<tr><th align="left">Name</th><td>&nbsp;&nbsp;</td><td>$name</td></tr>
<tr><th align="left">Category</th><td>&nbsp;&nbsp;</td><td>$category</td></tr>
<tr><th align="left">Description</th><td>&nbsp;&nbsp;</td><td>$description</td></tr>
<tr><th align="left">Price</th><td>&nbsp;&nbsp;</td><td>\$$price</td></tr>
<tr><th align="left" valign="top">Manufacturer</th><td>&nbsp;&nbsp;</td><td>
ID: $man_id<br>
$man_name<br>
$address<br>
$city, $state $zip
</td></tr>
</table>
EOHTML
        } else {
            $r->print("Product ID <b>$posted_prod_id</b> not found in our database.\n");
        }


        $sth->finish();
        $dbh->disconnect();
    } else {
        $r->print("<p>Please enter a valid product ID</p>");
    }

    $r->print(<<EOHTML);
<hr>
Click 
<a href="/productfilter/"><font color="#999966"><b>here</b></font></a> 
to find another product.
EOHTML

    $r->print(bottom_html());

    return OK;
}

1;
