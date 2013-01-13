#! /usr/bin/perl
# widgets.cgi

use CGI ':standard';

# get the posted form data
$language         = param('language')         || 'Perl';
$comments         = param('comments')         || '';
$coolness         = param('coolness')         || 'Ice Cold';
$learnmore        = param('learnmore')        || 'yes';
$operating_system = param('operating_system') || 'Linux';

# use an array here since we can choose more than one animal
@animal           = param('animal');

# make sure $learnmore has the value of either 'yes' or 'no'
$learnmore = 'no' unless $learnmore eq 'yes';

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
