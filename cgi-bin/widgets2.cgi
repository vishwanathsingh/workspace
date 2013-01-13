#! /usr/bin/perl
# widgets2.cgi

use strict;
use CGI ':standard';

if (param) {
    # we are here if there was any data posted, so process it

    # get the posted form data
    my $language         = param('language')         || 'Perl';
    my $comments         = param('comments')         || '';
    my $coolness         = param('coolness')         || 'ice cold';
    my $learnmore        = param('learnmore')        || 'no';
    my $operating_system = param('operating_system') || 'Linux';
    
    # use an array here since we can choose more than one animal
    my @animal           = param('animal');
    
    print
        header(),
        start_html(-title   => 'Process Widgets',
                   -bgcolor => '#ffffff'),
        h1('Process widgets'),
        'You entered the following infomation into the form:',
        br(),
        'Language: ',
        b($language),
        br(),
        'Comments:',
        br(),
        b($comments),
        br(),
        'Coolness level: ',
        b($coolness),
        br(),
        'You want to learn more about Perl and CGI: ',
        b($learnmore),
        br(),
        'Your operating system of choice is: ',
        b($operating_system),
        br(),
        'You favorite animal(s) is/are: ',
        b("@animal"),
        end_html;
} else {
    # if we are here, then we need to build the form
    # so print the header, then the html

    print
        header(),
        <<EOHTML;
<html>
<head>
<title>An Example of Form Widgets</title>
</head>
<body bgcolor="#ffffff">
<h1>An Example of Form Widgets</h1>
<form action="/cgi-bin/widgets2.cgi" method="post">
Programming language: <input type="text" name="language" value="Perl">
<br>
Comments: 
<br>
<textarea name="comments" cols="20" rows="5"></textarea>
<br>
Rate the coolness:
<input type="radio" name="coolness" value="cool"> cool
<input type="radio" name="coolness" value="very cool"> very cool
<input type="radio" name="coolness" value="ice cold" checked> ice cold
<br>
I will learn more about Perl and CGI:
<input type="checkbox" name="learnmore" value="yes" checked> Yes
<br>
I will use this operating system:
<select name="operating_system" size="1">
  <option>Linux</option>
  <option>Solaris</option>
  <option>HPUX</option>
</select>
<br>
My favorite animal(s):
<select name="animal" size="3" multiple>
  <option>Penguin</option>
  <option>Camel</option>
  <option>Llama</option>
  <option>Panther</option>
</select>
<br>
<br>
<input type="submit" value="Submit Form">
<input type="reset" value="Reset Form">
</form>
</body>
</html>
EOHTML
}
