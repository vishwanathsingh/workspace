<?
    $title = $HTTP_POST_VARS["title"];
    $text  = $HTTP_POST_VARS["text"];

    if ($title and $text) {
        // we have posted data -- first check its length
        // so noone nasty is posting a 10meg text value
        if (strlen($title) < 60 or strlen($text) < 1000) {

        // connect to the server
        $mysql = mysql_connect("localhost", "apache", "LampIsCool")
                         or die("could not connect to mysql");

        // select the "journal" database
        mysql_select_db("journal")
            or die("select failed - " . mysql_errno() . ": " . mysql_error());

        // insert into the table
        #mysql_query("INSERT INTO entries (title,text,date) 
        #             VALUES ('$title','$text',now())")
        #    or die("query failed - " . mysql_errno() . ": " . mysql_error());
        }
    } else {
        // clear out the title and the text
        $title = "";
        $text  = "";
    }
?>
<html>
<head>
<title>Open Source Web Book - PHP Project</title>
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
<a href="/contents/php/"><font color="#999966"><b>PHP</b></font></a> -
<a href="/php/project/"><font color="#999966"><b>Project</b></font></a> -
Add
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
    <tr><td><a href="/contents/cgi/"><font 
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
<p><font color="#FF0000"><b>PHP Project - Add Entry</b></font><br></p>
<? 
    if ($title and $text) {
        print "<p>Entry added!  Fill out the form below to add another entry.";
        print "Or, click the link below to see the added entry.</p>";
    } else {
        print "<p>Fill out the form below to add an entry:</p>";
    }
?>
<form action="/php/project/add/" method="post">
<table>
  <tr>
    <td>Title:</td>
    <td><input type="text" name="title" width="60">
  </tr>
  <tr>
    <td valign="top">Text:</td>
    <td><textarea name="text" cols="40" rows="5"></textarea></td>
  </tr>
  <tr>
    <td colspan="2">
        <input type="submit" value="Add Entry">
        <input type="reset" value="Reset Entry">
    </td>
  </tr>
</table>
</form>
<hr>
<p><a href="/php/project/view/"><font color="#999966"><b>View journal
entries</b></font></a>
</td>
<td width="65">&nbsp;</td>
</tr>
</table>
</body>
</html>
