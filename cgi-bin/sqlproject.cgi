#! /usr/bin/perl
# sqlproject.cgi

use strict;
use DBI;
use CGI ':standard';
use Config::General;
my $conf = new Config::General("sqlproject.config");
my %config = $conf->getall;
my $dbh;

sub connectDB{
$dbh= DBI->connect('dbi:mysql:'.$config{dbname},$config{user},$config{password}) or die "connection error";
return $dbh;
}

sub showTables{
$dbh=connectDB();
my $sql="select * from ".$_[0];
my  $sth=$dbh->prepare($sql);
$sth->execute;
while (my @row = $sth->fetchrow_array ) {
    print "@row\n";
 }
}


sub form{

print header,
	start_html(-title => 'Royal Residency',
		   -bgcolour => '#ffffff'),
	h1('Royal Residence'),
	start_form(),
	textfield(-name=>'Firstname',
		-maxlength=>255),
	br(),
	textfield(-name=>'LastName',
		-maxlength=>255),
	br(),
	textfield(-name=>'Address',
		-maxLength=>255
		),
	br(),
	textfield(-name=>'City',
		-maxLength=>255
	),
	br(),
	submit(-name=> 'button_name',
	-value => 'Submit Form'),
	end_form();
}

sub insertValue{
$dbh=connectDB();
my $sth=$dbh->prepare('inset into'.$_[1].' values ( ? , ? ,? , ?, ?)');
$sth->execute($_[0],$_[1],$_[3],$_[4]);
}


#showTables('Persons');
form();
if(param){
my $name= param('field_name');
print "Hi ".$name." !";	
}



