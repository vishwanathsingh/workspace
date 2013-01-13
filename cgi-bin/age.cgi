#!/usr/bin/perl
# age.cgi

# use our modules
use strict;
use CGI ':standard';
use DBI;

####
#
# top_html() - a subroutine to return the top of the HTML code
#
####

sub top_html {
    return <<EOHTML;
<html>
<head>
<meta name="Copyright" 
    content="2001 James Lee, http://www.opensourcewebbook.com">
<meta name="Author"    content="James Lee, james\@opensourcewebbook.com">
<meta name="Generator" content="WML 2.0.8 (30-Oct-2001)">
<meta name="Modified"  content="2001-12-18 09:04:06">
<meta name="Keywords"
    content="open source,linux,apache,mysql,perl,embperl,mason,php">
<meta name="Description" 
    content="Opens Source Web Development Companion Website">
<title>Open Source Web Book | CGI | age.cgi</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#FFFFFF" text="#333333" leftmargin="0" topmargin="0"
marginwidth="0" marginheight="0" link="#333333">
<table width="780" border="0" cellspacing="0" cellpadding="0" summary="">
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
<table width="780" border="0" cellspacing="0" cellpadding="0" summary="">
<tr>
<td width="15">&nbsp;</td>
<td width="570">
<font color="#FF0000"><b>Page Path - </b></font>
<a href="/contents/"><font color="#999966"><b>Contents</b></font></a> - 
<a href="/contents/cgi/"><font color="#999966"><b>CGI</b></font></a> -
<a href="/cgi-bin/age.cgi"><font color="#999966"><b>age.cgi</b></font></a> 
&nbsp;
</td>
<td width="195">
<div align="center"><a href="../"><img src="/icons/logo.gif"
width="177" height="51" border="0" alt=""></a></div>
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
</table>
<table width="780" border="0" cellspacing="0" cellpadding="0" summary="">
<tr>
<td width="15">&nbsp;</td>
<td width="168" valign="top">
<table width="164" cellspacing="3" cellpadding="0" summary="">
<tr><td><a href="../"><font
color="#999966"><b>Home</b></font></a></td></tr>
<tr><td><a href="../about/"><font
color="#999966"><b>About</b></font></a></td></tr>
<tr><td><a href="../foreword/"><font
color="#999966"><b>Foreword</b></font></a></td></tr>
<tr><td><a href="../reviews/"><font
color="#999966"><b>Reviews</b></font></a></td></tr>
<tr><td><a href="../authors/"><font
color="#999966"><b>Authors</b></font></a></td></tr>
<tr><td><a href="../purchase/"><font
color="#999966"><b>Purchase</b></font></a></td></tr>
<tr><td><a href="../errata/"><font
color="#999966"><b>Errata</b></font></a></td></tr>
<tr><td><a href="../sourcecode/"><font
color="#999966"><b>Sourcecode</b></font></a></td></tr>
<tr><td><a href="../resources/"><font
color="#999966"><b>Resources</b></font></a></td></tr>
<tr><td><a href="../tools/"><font
color="#999966"><b>Tools</b></font></a></td></tr>
<tr><td><a href="../contents/"><font
color="#999966"><b>Contents</b></font></a></td></tr>
<tr><td>
  <table width="130" cellspacing="3" cellpadding="0" align="right"
summary="">
    <tr><td><a href="../contents/linux/"><font
color="#999966"><b>Linux</b></font></a></td></tr>
    <tr><td><a href="../contents/apache/"><font
color="#999966"><b>Apache</b></font></a></td></tr>
    <tr><td><a href="../contents/perl/"><font
color="#999966"><b>Perl</b></font></a></td></tr>
    <tr><td><a href="../contents/mysql/"><font
color="#999966"><b>MySQL</b></font></a></td></tr>
    <tr><td><a href="../contents/wml/"><font
color="#999966"><b>WML</b></font></a></td></tr>
    <tr><td><a href="../contents/cgi/"><font 
color="#999966"><b>CGI</b></font></a></td></tr>
    <tr><td><a href="../contents/mod_perl/"><font
color="#999966"><b>mod_perl</b></font></a></td></tr>
    <tr><td><a href="../contents/ssi/"><font
color="#999966"><b>SSI</b></font></a></td></tr>
    <tr><td><a href="../contents/embperl/"><font
color="#999966"><b>Embperl</b></font></a></td></tr>
    <tr><td><a href="../contents/mason/"><font
color="#999966"><b>Mason</b></font></a></td></tr>
    <tr><td><a href="../contents/php/"><font
color="#999966"><b>PHP</b></font></a></td></tr>
  </table>
</td></tr>
</table>
</td>
<td width="10">&nbsp;</td>
<td width="2" bgcolor="#999966">&nbsp;</td>
<td width="20">&nbsp;</td>
<td width="550" valign="top">


<p><font color="#FF0000"><b>age.cgi</b></font><br></p>
EOHTML
}

####
#
# bottom_html() - a subroutine to return the bottom of the html
#
####

sub bottom_html {
    return <<EOHTML;
</td>
</tr>
</table>
<p>&nbsp;</p>
</td>
<td width="15">&nbsp;</td>
</tr>
</table>
</body>
</html>
EOHTML
}

####
#
# handle_error() - a subroutine we can use to handle any error
#       conditions
#
####

sub handle_error {
    my $msg = shift || '';
    my $dbh = shift || '';
    my $sth = shift || '';

    print <<EOHTML;
Content-type: text/html

<head>
<title>Age Information Error</title>
</head>
<body bgcolor="#ffffff">
There was an error: <b>$msg</b>
</body>
</html>
EOHTML

    # finish the state handle and disconnect, if necessary
    $sth->finish()     if $sth;
    $dbh->disconnect() if $dbh;
    exit 0;
}

####
#
# process_form_data() - subroutine to process the form data:
#    we get the posted data, check to make sure we have received
#    what we need, do some sanity checking on the data, then insert
#    the data into our table
#
####

sub process_form_data {
    # get the argument passed in, the database handle
    my $dbh = shift;

    # get the posted data
    my $lname = param('lname') || '';
    my $fname = param('fname') || '';
    my $age   = param('age')   || 0;

    # check to be sure we have all the fields
    unless ($lname and $fname and $age) {
        handle_error('You need to enter last name, first name and age!', 
                     $dbh);
    }

    # check the length of our data
    if (length($lname) > 20 or length($fname) > 20 or length($age) > 3) {
        handle_error('The length of your data is too long!', $dbh);
    }

    # error out if the age is not numeric (contains a character which is
    # not a digit
    if ($age =~ /\D/) {
        handle_error('Your age is not numeric!', $dbh);
    }

    # ok, now insert data
    my $sth = $dbh->prepare('INSERT INTO age_information 
                          (lastname, firstname, age) VALUES (?,?,?)')
            or handle_error("Can't prepare SQL: " . $dbh->errstr(), $dbh);

    #$sth->execute($lname, $fname, $age)
    #        or handle_error("Can't execute SQL: " . $dbh->errstr(), 
    #                        $dbh, $sth);
}


####
#
# herein begins the main code
#
####

# connect to the MySQL server
my $dbh = DBI->connect('DBI:mysql:people', 'apache', 'LampIsCool')
        or handle_error("Can't connect..." . DBI->errstr());

# if param() returns true, we have parameters, so process them
if (param()) {
    process_form_data($dbh);
}

# here we query the db for the data that is to be 
# displayed in a table
my $sth = $dbh->prepare('SELECT lastname, firstname, age FROM age_information')
        or handle_error("Can't prepare SQL" . $dbh->errstr(), $dbh);

$sth->execute()
        or handle_error("Can't execute SQL" . $sth->errstr(), $dbh, $sth);

# now, create HTML for the table and the form
# first, use CGI methods and our defined subroutines
# to build HTML
print 
    header(),
    top_html(),   # this is our subroutine defined above
    <<EOHTML;
<h2>Current Name/Age Information</h2>
<table border="1">
<tr><th>Last Name</th><th>First Name</th><th>Age</th></tr>
EOHTML

# and print the records in the table
my($ln,$fn,$age);
while (($ln,$fn,$age) = $sth->fetchrow()) {
    print "<tr><td>$ln</td><td>$fn</td><td>$age</td></tr>\n";
}

# print the end of the table, then the form using a 
# here document
print 
    <<EOHTML;
</table>
<hr>
<h2>Enter New Name/Age Information</h2>
If you enter your name and age, you will be added to the database
and will be displayed above.
<form action="/cgi-bin/age.cgi" method="post">
<table border="0">
  <tr>
    <td>Last name:</td>
    <td><input type="text" name="lname" maxsize="20" value=""></td>
  </tr>
  <tr>
    <td>First name:</td>
    <td><input type="text" name="fname" maxsize="20" value=""></td>
  </tr>
  <tr>
    <td>Age:</td>
    <td><input type="text" name="age" maxsize="20" value=""></td>
  </tr>
  <tr>
    <td><input type="submit" value="Submit Data"></td>
    <td><input type="reset" value="Reset Form"></td>
  </tr>
</table>
</form>
<p><i><b>Note:</b> due to the large number of people running this program,
your data will not be inserted into the database.</i></p>
EOHTML

print
    bottom_html();  # this is our subroutine defined above

# clean up
$sth->finish();
$dbh->disconnect();
