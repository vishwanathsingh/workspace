# MySQL dump 8.14
#
# Host: localhost    Database: journal
#--------------------------------------------------------
# Server version	3.23.41

#
# Table structure for table 'entries'
#

CREATE TABLE entries (
  id int(11) NOT NULL auto_increment,
  title varchar(60) default NULL,
  text blob,
  date datetime default NULL,
  PRIMARY KEY  (id)
) TYPE=MyISAM;

#
# Dumping data for table 'entries'
#

INSERT INTO entries VALUES (1,'became aware of LAMP','I learned about Linux/Apache/MySQL/(Perl|PHP) today.  I am now aware that There Is A Better Way.','2002-04-01 10:23:31');
INSERT INTO entries VALUES (2,'Linux and Apache','I have discovered that Linux and Apache are shining examples of Open Source projects.','2002-04-03 11:03:52');
INSERT INTO entries VALUES (3,'Perl Motto','The Perl motto is \"There\'s more than one way to do it,\" or TMTOWTDI.','2002-04-05 16:13:22');
INSERT INTO entries VALUES (4,'CGI and mod_perl','CGI and mod_perl are excellent ways to create web server programs to dynamically serve up web pages.','2002-04-08 12:43:26');
INSERT INTO entries VALUES (5,'Embperl and Mason','I learned about Embperl and Mason - two Perl modules to embed executable code into  HTML.  Now the hard part - which do I choose?  I suppose I should experiment with both and make my choice since TMTOWTDI.','2002-04-10 19:02:51');
INSERT INTO entries VALUES (6,'PHP is cool!','Learning PHP is the best thing that I did today.','2002-04-16 08:19:28');

