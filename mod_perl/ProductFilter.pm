package ProductFilter;
# ProductFilter.pm

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
<title>Open Source Web Book - Product Filter</title>
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
href="/productfilter/"><font color="#999966"><b>/productfilter/</b></font></a>
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
<p><font color="#FF0000"><b>Product Filter Built with 
MySQL</b></font><br></p>
<p>This is the product filter for the MySQL project.
Please select from the category buttons to filter the
products displayed.
<hr>
<p></p>
EOHTML
}

sub bottom_html {
    return <<EOHTML;
</table>
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
# handler()
#
####
sub handler {
    # get the request object
    my $r = new Apache::Request(shift);

    # get the posted form data
    my $posted_city         = $r->param('city')         || '';
    my $posted_manufacturer = $r->param('manufacturer') || '';
    my $posted_category     = $r->param('category')     || '';

    
    # if any of the posted form data is `Select One' or '------'
    # then set the posted form data variable to empty string
    # since the user did not select one of the options
    $posted_city         = '' if $posted_city eq 'Select One' 
                                 or $posted_city eq '------';
    $posted_manufacturer = '' if $posted_manufacturer eq 'Select One' 
                                 or $posted_manufacturer eq '------';
    $posted_category     = '' if $posted_category eq 'Select One' 
                                 or $posted_category eq '------';

    # make sure that the posted data contains the data we want
    # (no nasty characters) and the length we expect - if the
    # data looks bad, set the variable to empty string
    unless ($posted_city =~ /^[\w '\.]+$/) {
        $posted_city = '';
    }
    if (length($posted_city) > 60) {
        $posted_city = '';
    }
    unless ($posted_manufacturer =~ /^[\w '\.]+$/) {
        $posted_manufacturer = '';
    }
    if (length($posted_manufacturer) > 60) {
        $posted_manufacturer = '';
    }
    unless ($posted_category =~ /^[\w '\.]+$/) {
        $posted_category = '';
    }
    if (length($posted_category) > 60) {
        $posted_category = '';
    }


    my $sql_cond = '';
    my @execute_args = ();
    
    if ($posted_city or $posted_manufacturer or $posted_category) {
        if ($posted_city) {
            $sql_cond .= ' AND manufacturers.city = ?';
            push @execute_args, $posted_city;
        }
        if ($posted_manufacturer) {
            $sql_cond .= 'AND manufacturers.name = ?';
            push @execute_args, $posted_manufacturer;
        }
        if ($posted_category) {
            $sql_cond .= 'AND products.category = ?';
            push @execute_args, $posted_category;
        }
    }

    # set the content type and send the header
    $r->content_type('text/html');
    $r->send_http_header();

    $r->print(top_html());

    my $dbh = DBI->connect('DBI:mysql:product_database','apache','LampIsCool') 
            or return handle_error($r, DBI->errstr());

    my $sth = $dbh->prepare('SELECT DISTINCT city FROM manufacturers ORDER BY city')
            or return handle_error($r, $dbh->errstr(), $dbh);
    $sth->execute() or return handle_error($r, $sth->errstr(), $dbh, $sth);

    my(@cities,$city_name);
    while (($city_name) = $sth->fetchrow()) {
        push @cities, $city_name;
    }

    $sth = $dbh->prepare('SELECT DISTINCT name FROM manufacturers ORDER BY name')
            or return handle_error($r, $dbh->errstr(), $dbh);
    $sth->execute() or return handle_error($r, $sth->errstr(), $dbh, $sth);

    my(@man_names,$man_name);
    while (($man_name) = $sth->fetchrow()) {
        push @man_names, $man_name;
    }

    $sth = $dbh->prepare('SELECT DISTINCT category FROM products ORDER BY category')
            or return handle_error($r, $dbh->errstr(), $dbh);
    $sth->execute() or return handle_error($r, $sth->errstr(), $dbh, $sth);

    my(@categories,$category_name);
    while (($category_name) = $sth->fetchrow()) {
        push @categories, $category_name;
    }

    $r->print(<<EOHTML);
<form action="/productfilter/" method="post">
  <table cellspacing="10" cellpadding="10">
    <tr>
      <td>Manufacturer City<br>
        <select name="city">
EOHTML

    if ($posted_city eq '') {
        $r->print(<<EOHTML);
          <option selected>Select One</option>
          <option>------</option>
EOHTML
    } else {
        $r->print(<<EOHTML);
          <option>Select One</option>
          <option>------</option>
EOHTML
    }

    foreach $city_name (@cities) {
        if ($city_name eq $posted_city) {
            $r->print("          <option selected>$city_name</option>\n");
        } else {
            $r->print("          <option>$city_name</option>\n");
        }
    }

    $r->print(<<EOHTML);
        </select>
      </td>
      <td>Manufacturer<br>
        <select name="manufacturer">
EOHTML

    if ($posted_manufacturer eq '') {
        $r->print(<<EOHTML);
          <option selected>Select One</option>
          <option>------</option>
EOHTML
    } else {
        $r->print(<<EOHTML);
          <option>Select One</option>
          <option>------</option>
EOHTML
    }

    foreach $man_name (@man_names) {
        if ($man_name eq $posted_manufacturer) {
            $r->print("          <option selected>$man_name</option>\n");
        } else {
            $r->print("          <option>$man_name</option>\n");
        }
    }

    $r->print(<<EOHTML);
        </select>
      </td>
      <td>Category<br>
        <select name="category">
EOHTML

    if ($posted_category eq '') {
        $r->print(<<EOHTML);
          <option selected>Select One</option>
          <option>------</option>
EOHTML
    } else {
        $r->print(<<EOHTML);
          <option>Select One</option>
          <option>------</option>
EOHTML
    }

    foreach $category_name (@categories) {
        if ($category_name eq $posted_category) {
            $r->print("          <option selected>$category_name</option>\n");
        } else {
            $r->print("          <option>$category_name</option>\n");
        }
    }

    $r->print(<<EOHTML);
        </select>
      </td>
    </tr>
    <tr>
      <td colspan="3" align="center"><input type="submit" value="Filter Now"></td>
    </tr>
  </table>
</form>
<table width="490" border="0" cellspacing="0" cellpadding="3">
  <tr align="left">
    <th>Name</th>
    <th>Category</th>
    <th>Price</th>
  </tr>
  <tr>
    <th colspan="3"><hr></td>
  </tr>
EOHTML

    $sth = $dbh->prepare('SELECT products.prod_id,products.name,
                                 products.category,products.price 
                          FROM manufacturers, products 
                          WHERE manufacturers.man_id = products.man_id '
                          . $sql_cond .
                          'ORDER BY products.category, products.name')
            or return handle_error($r, $dbh->errstr(), $dbh);

    $sth->execute(@execute_args) or return handle_error($r, $sth->errstr(), $dbh, $sth);

    my($prod_id,$name,$category,$price);
    my $i = 0;
    while (($prod_id,$name,$category,$price) = $sth->fetchrow) {
        my $bgcolor = '#ffffff';
        if ($i % 2 == 1) {
            $bgcolor = '#cccccc';
        }
        $r->print(<<EOHTML);
  <tr bgcolor="$bgcolor">
    <td><a href="/productdetail/?prod_id=$prod_id"><font color="#999966"><b>$name</b></font></a></td>
    <td>$category</td>
    <td>\$$price</td>
  </tr>
EOHTML
        $i++;
    }

    $r->print(bottom_html());

    $sth->finish();
    $dbh->disconnect();

    return OK;
}
####
#
# end of handler()
#
####

1;
