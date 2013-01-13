#! /usr/bin/perl
# widgets3.cgi

use CGI ':standard';

if (param) {
    # we are here if there was any data posted, so process it

    # get the posted form data
    $language         = param('language')         || 'Perl';
    $comments         = param('comments')         || '';
    $coolness         = param('coolness')         || 'ice cold';
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
} else {
    # if we are here, then we need to build the form
    # so print the header, then the html

    print
        header(),
        start_html(-title   => 'An Example of Form Widgets',
                   -bgcolor => '#ffffff'), 
        h1('An Example of Form Widgets'),
        start_form(),
        'Programming language: ',
        textfield(-name => 'language', -value => 'Perl'),
        br(),
        'Comments:',
        br(),
        textarea(-name  => 'comments',
                 -cols  => 20,
                 -rows => 5),
        br(),
        'Rate the coolness: ',
        radio_group(-name   => 'coolness',
                    -values => ['cool', 'very cool', 'ice cold'],
                    -default => 'ice cold'),
        br(),
        'I will learn more about Perl and CGI: ',
        checkbox(-name => 'learnmore', 
                 -value => 'yes',
	         -label => ' Yes',
                 -checked => 1),
        br(),
        'I will use this operating system: ',
        popup_menu(-name   => 'operating_system',
                   -values => ['Linux', 'Solaris', 'HPUX'],
                   -size   => 1),
        br(),
        'My favorite animal(s): ',
        scrolling_list(-name     => 'animal',
                       -values   => ['Penguin', 'Camel', 'Llama', 'Panther'],
                       -size     => 3,
                       -multiple => 1),
        br(),
        br(),
        submit(-value => 'Submit Form'),
        ' ',
        reset(-value => 'Reset Form'),
        end_form();
}
