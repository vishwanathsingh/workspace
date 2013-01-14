#! /usr/bin/perl
# sqlproject.cgi

use strict;
use DBI;
use CGI ':standard';
use Config::General;
use HTTP::Request::Common 'POST';
use LWP::UserAgent;

my $conf = new Config::General("sqlproject.config");
my %config = $conf->getall;
my $dbh;
my $mobileName;

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

my %labels=(
	'nokia' => 'Nokia',
	'samsung' => 'Samsung',
	'motorola' => 'Motorola',
	'sony' => 'Sony'
);

print header,
	start_html(-title => 'Royal Residency',
		   -bgcolour => '#ffffff'),
	h1('Royal Residence'),
	start_form(),
	textfield(-name=>'FirstName',
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
	scrolling_list(
			-name =>'mobileList',
			-values=>['nokia','samsung','motorola','sony'],
			-multiple=>'false',
			-size=>4,
			-labels=>\%labels
	),
	
	br(),
	submit(-name=> 'button_name',
	-value => 'Submit Form'),
	end_form();
}

sub insertValue{
$dbh=connectDB();
my $sth=$dbh->prepare('insert into '.$_[0].' values ( ? , ? ,? , ?, ?)');
$sth->execute($_[1],$_[2],$_[3],$_[4],$_[5]);
}

sub writeToFile{
	my $line;
	my $fileName=$mobileName.'txt';
	open(FH,'>'.$fileName) or die "Can't open this shit to write";
	while($line=$_[0]){
	print FH $line;
	}
	close FH;
}

sub getHTTPCode{
	my @httpcode=split(/\n/,$_[0]);
	my @code=split(/\s/,@httpcode[0]);
	#print $code[1];
	if ($code[1] == 301){
	my $i ==0;
	while( $i <= $#httpcode){
	if ($httpcode[$i] =~ /Location/ ){
	my @location = split(/\s/,$httpcode[$i]);
	my $ua=LWP::UserAgent->new();
	my $req = POST "http://www.flipkart.com".$location[1];
	my $fetchedPage = $ua->request($req)->as_string;
	writeToFile($fetchedPage);
	last;
	}
	$i++;
	}}
}

sub fetchFromFlipkart{
#$dbh=connectDB();
#my $sth=$dbh->
#system "wget http://www.flipkart.com/mobiles/".$_[0];
my $ua=LWP::UserAgent->new();
my $req = POST "http://www.flipkart.com/mobiles/nokia";
my $fetchedPage = $ua->request($req)->as_string;
if(getHTTPCode($fetchedPage) == 301)
{
print 'this has been moved';
}

}

#showTables('Persons');
#form();
fetchFromFlipkart();
if(param){
#print param;
insertValue('Persons',0,param('FirstName'),param('LastName'),param('Address'),param('City'));
$mobileName = param('mobileList');
}



