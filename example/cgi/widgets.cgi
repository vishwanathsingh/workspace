#! /usr/bin/perl
# widgets.cgi

use strict;
use CGI ':standard';

# get the posted form data
my $language         = param('language')         || 'Perl';
my $comments         = param('comments')         || '';
my $coolness         = param('coolness')         || 'Ice Cold';
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
