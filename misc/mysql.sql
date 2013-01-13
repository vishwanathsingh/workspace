# MySQL dump 8.14
#
# Host: localhost    Database: 
#--------------------------------------------------------
# Server version	3.23.41

#
# Current Database: books
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ books;

USE books;

#
# Table structure for table 'book_information'
#

DROP TABLE IF EXISTS book_information;
CREATE TABLE book_information (
  isbn varchar(10) NOT NULL default '',
  author varchar(100) default NULL,
  title varchar(100) default NULL,
  publisher varchar(100) default NULL,
  date varchar(20) default NULL,
  description text,
  price float default NULL,
  PRIMARY KEY  (isbn)
) TYPE=MyISAM;

#
# Dumping data for table 'book_information'
#

LOCK TABLES book_information WRITE;
INSERT INTO book_information VALUES ('020177061X','James Lee, Brent Ware','Open Source Web Development with Lamp','Addison Wesley Professional','December 2002','Programming the web with Linux, Apache, MySQL and Perl|PHP.',49.99),('0596000278','Larry Wall, Tom Christiansen, Jon Orwant','Programming Perl (3rd Edition)','O\'Reilly & Associates','July-00','The best book about Perl written by Larry Wall, the creator of Perl.',49.95),('1558285989','Steve Oualline, Eric Foster-Johnson','Teach Yourself Linux','Hungry Minds, Inc','February-00','Written in jargon-free language, Teach Yourself Linux is full of cross-references, visual step-by-step procedures, and real-world applications',24.99),('1565922433','Tom Christiansen, Nathan Torkington, Larry Wall','Perl Cookbook','O\'Reilly & Associates','August-98','If you want to cook with Perl, this book is loaded with very useful recipes to perform all kinds of tasks.',39.95),('1565922603','Jerry D. Peek, Tim O\'Reilly, Mike Loukides','UNIX Power Tools','O\'Reilly & Associates','October-97','Ideal for UNIX users who hunger for technical -- yet accessible -- information',59.95),('1565923472','Cameron Newham  Bill Rosenblatt','Learning the Bash Shell ','O\'Reilly & Associates','March-98','Whether you want to use bash for its user interface or itsprogramming features you will find Learning the bash Shell avaluable guide.',29.95),('1565924193','Scott Guelich, Shishir Gundavaram, Gunther Birznieks','CGI Programming with Perl (2nd Edition)','O\'Reilly & Associates','July-00','Explains how to use the common gateway interface (CGI) to create and deliver dynamic content on the web.',34.95),('1565924347','Randy Jay Yarger, George Reese, Tim King','MySQL and mSQL','O\'Reilly & Associates','August-99','This book is all you need to make use of MySQL or mSQL, two popular, easy-to-use databases for UNIX and Linux systems ',34.95),('1565925289','Ben Laurie, Peter Laurie, Robert Denn','Apache : The Definitive Guide','O\'Reilly & Associates','February-99','I found this book a good training source and reference manual.',34.95),('1565925793','Jennifer Niederst','HTML Pocket Reference','O\'Reilly & Associates','December-99','If you already know HTML well and have a good HTML reference book, this book will allow you to quickly look up information tags and attributes.',9.95),('1565926277','Bill McCarty','Learning Red Hat Linux','O\'Reilly & Associates','September-99','This is the best linux book for the beginner I have seen.',34.95),('1565926994','Alligator Descartes, Tim Bunce','Programming the Perl DBI','O\'Reilly & Associates','February-00','Far from being a formalized how-to or man page, Programming Perl\'s DBI is a mini textbook in database programming, ideal for CPAN-savvy Perl programmers with little or no experience in database programming.',34.95),('1565927060','Andrew Ford, Gigi Estabrook','Apache : Pocket Reference','O\'Reilly & Associates','June-00','This little book covers the latest version of Apache, and was packed with info for its size.',9.95),('1576104192','Dee-Ann LeBlanc','Linux Administration Black Book ','Coriolis Group','April-00','Lee-Ann Blanc has crafted a great single source for answers to the questions Linux sysadmins care about most.',49.99),('1861002971','Neil Matthew, Richard Stones','Beginning Linux Programming','Wrox Press Inc','September-99','This is a really cool book, not only technically, but a decent read also.',39.99),('1861003013','Neil Matthew and Richard Stones, et. al.','Professional Linux Programming','Wrox Press Inc','September-00','Aimed at the experienced C/C++ programmer, Professional Linux Programming provides a wide-ranging and hands-on guide to the different pieces of the puzzle ',59.99),('1861003021','Peter Wainwright','Professional Apache','Wrox Press Inc','November-99','In short, there\'s nothing you can do with Apache that this book can\'t show you, in my opinion.',49.99),('1861003730','Chris Lea, Wankyu Choi, Allan Kent, Ganesh Prasad, Chris Ullman','Beginning PHP4','Wrox Press Inc','October-00','Beginning PHP4 offers an almost ideal introductory tutorial to one of today\'s hotter scripting languages. ',39.99),('1886411484','Michael Stutz','The Linux Cookbook : Tips and Techniques for Everyday Use','No Starch Pr','August-01','Michael Stutz shows and tells how to do nearly everything using \"pure\" GNU/Linux tools and applications',29.95),('1893115577','Michael Kofler, David Kramer (Translator)','MySQL','APress','June-05','Kofler\'s MySQL introduces the many facets of MySQL, guiding the reader through installation, configuration, and subsequent implementation',39.95),('1893115852','W. J. Gilmore','A Programmer\'s Introduction to PHP 4.0','APress','December-00','A Programmer\'s Introduction to PHP 4.0 addresses experienced programmers and Web developers--no matter what language they are familiar with. ',34.95),('9875260436','Hector Facundo Arena, MP Ediciones','Manual de Linux Facil con CD-ROM','MP Ediciones SA','October-00','Este libro proporciona al lector que quiere comenzar a usar Linux todo lo necesario',19.9),('0066620724','Linus Torvalds, David Diamond','Just for Fun : The Story of an Accidental Revolutionary','Harperbusiness','May-01','Linus discusses such things as life in Finland, coming to the United States, developing the Linux kernel, and the future of Open Source and Free Software.',26),('0072122919','Mark Allan Arnold, Clint Miller, James Sheetz, Jeff D. Almeida','Administering Apache','McGraw-Hill Professional Publishing','May-00','Administering Apache gives plenty of detail on everyday interactions with the Apache software ',44.99),('0072127732','Brian Hatch, James B. Lee, George Kurtz','Hacking Linux Exposed','McGraw-Hill Professional Publishing','March-01','Instead of pointing at things and letting you read other people\'s code, it walks you through the theory and exploits, letting you try out the attack manually on your own system as you read the book.',39.99),('0072129409','Richard Petersen','LINUX the Complete Reference','McGraw-Hill Professional Publishing','December-00','An easy-to-use reference for installing, using, and getting optimum results from Linux. ',39.99),('0072131365','Steve Shah','Linux Administration: A Beginner\'s Guide','McGraw-Hill Professional Publishing','January-01','helps readers adapt their Windows experience to Linux work ',39.99),('0130163910','Scott Hawkins, Joe Brockmeier','Linux Desk Reference','Prentice Hall PTR','November-99','Explains all the basic concepts you need to understand in order to use the Linux system. ',29.99),('0130206016','Evi Nemeth, Garth Snyder, Scott Seebass, Trent R. Hein','UNIX System Administration Handbook','Prentice Hall PTR','August-00','Every Linux/BSD/UNIX administrator must have this book in his back of goodies (next to the perl cookbook offcourse).',68),('0130882232','Mark F. Komarinski','The Complete Red Hat Linux Training Course with Cdrom ','Prentice Hall PTR','June-00','Start-to-finish, 400-page guide to Linux system administration, covering every issue and technique you need to know.',99.99),('0130898732','Scott Hawkins','Apache Web Server Administration and e-Commerce Handbook','Prentice Hall PTR','December-00','The intention of this book is to serve as a broad-based tutorial and reference for the Apache Web server.',44.99),('0201178052','Dave Raggett (Editor), Jenny Lam (Contributor), Ian Alexander, Michael Kmiec (Contributor)','Raggett on Html 4','Addison-Wesley Pub Co','January-98','An insider\'s guide to publishing on the Internet, HTML Version X offers readers expert advice on taking advantage of HTML\'s new capabilities to create interactive Web pages. ',29.95),('0201422190','Thomas Boutell','Cgi Programming in C & Perl','Addison-Wesley Pub Co','May-96','An essential technical programming reference for Web sites. ',37.95),('0201596288','Michael Kofler','LINUX, Second Edition: Installation, Configuration, and Use','Addison-Wesley Pub Co','August-99','It is a great starting point to the Linux world, yet more advanced users will find it a good reference for the computer shelf.',44.95),('0201604701','Ralf S. Engelschall','Apache Desktop Reference','Addison Wesley Professional','December-00','A compact reference featuring information on every aspect of Apache functionality, installation, configuration, and operation. ',39.95),('0201615711','Lincoln D. Stein','Network Programming with Perl','Addison-Wesley Pub Co','December-00','Learn how to use Perl to perform various networking tasks.',44.95),('0201634627','Lincoln D. Stein','How to Set Up and Maintain a Web Site','Addison-Wesley Pub Co','January-97','An excellent book covering everything you will need to know about how to set up and maintain a web site.',42.95),('0201710145','Kevin Meltzer, Brent Michalski','Writing CGI Applications with Perl','Addison-Wesley Pub Co','February-01','Pick this up, along with Lincoln Stein\'s \"Official Guide to Programming with CGI.pm\", and you will be well on your way to Perl/CGI Nirvana.',39.95),('0201895498','Mark G. Sobell','A Practical Guide to Linux','Addison-Wesley Pub Co','June-97','A tutorial/reference for both beginners and experienced users, requiring no prior programming experience. ',44.95),('0471168963','Craig Patchett, Matthew Wright (Contributor), Peter Holfelder (Contributor)','The Cgi/Perl Cookbook','John Wiley & Sons','October-97','An invaluable resource for learning CGI scripting with Perl, especially for anyone who likes to learn by looking at actual code and having someone explain it.',54.95),('0471247448','Lincoln Stein','Official Guide to Programming With Cgi.Pm','John Wiley & Sons','April-98','A guide to using CGI.pm written by the creator of CGI.pm.',39.99),('0596000251','Ellen Siever (Editor), Jessica P. Hekman, Stephen Figgins, Spainhour, Stephen Spainhour','LINUX in A Nutshell: A Desktop Quick Reference (3rd Edition)','O\'Reilly & Associates','January-00','This book is a great reference of Linux commands, shell environments, and lots more.',34.95),('059600026X','Chuck Musciano, Bill Kennedy','HTML & XHTML : The Definitive Guide','O\'Reilly & Associates','August-00','HTML & XHTML: The Definitive Guide offers a more comprehensive and pragmatic look at the de facto markup language of today, as well as the emerging next step. ',34.95),('0596000472','Andrew Ford','Mod-Perl Pocket Reference','O\'Reilly & Associates','December-00','A pocket-sized reference for mod_perl, the Apache module that brings Apache and Perl together. ',9.95),('0596001088','Eric S. Raymond, Bob Young','The Cathedral and the Bazaar : Musings on Linux and Open Source by an Accidental Revolutionary','O\'Reilly & Associates','January-01','The Cathedral and the Bazaar takes its title from an essay Raymond read at the 1997 Linux Kongress. The essay documents Raymond\'s acquisition, re-creation, and numerous revisions of an e-mail utility known as fetchmail.',16.95),('0596001320','Randal L. Schwartz, Tom Christiansen, Larry Wall (Foreword)','Learning Perl (3d Edition)','O\'Reilly & Associates','July-01','If you are new to Perl, this book will help you learn it.',34.95),('0672315734','Peter Norton, Arthur Griffith','Peter Norton\'s Complete Guide to Linux','Sams','October-99','It explains how Linux works, how to set it up, and how to make it work better.',29.99),('0672317842','Luke Welling, Laura Thomson','PHP and MySQL Web Development','Sams','March-01','Authors Luke Welling and Laura Thomson\'s technique aims to get readers going on their own projects as soon as possible.',49.99),('0672318083','Richard Bowen, et. al.','Apache Server Unleashed','Sams','March-00','Apache Server Unleashed offers traditional documentation of this unconventional product. ',49.99),('0672318458','Judith Samson  Dallas G. Releford  Jason Byars','Sams Teach Yourself Red Hat Linux in 24 Hours with Cdrom ','Sams','December-00','A book/CD-ROM tutorial, using a step-by-step approach in 24 lessons of one hour or less. ',24.99),('0672319853','Bill Ball, David Pitts, William Ball','Red Hat Linux 7 Unleashed','Sams','November-00','This book/CD-ROM package gives practical advice and in-depth coverage of Red Hat Linux',49.99),('0672321327','Barrie Slaymaker','mod_perl Developer\'s Handbook','Sams','December-01','mod_perl Developer\'s Handbook is a hands-on guide to installing, configuring, and programming the increasingly popular mod_perl Apache module ',39.99),('0735709211','Paul DuBois, Michael Widenius','MySQL','New Riders Publishing','December-99','If you are new to DBMS, this book helps you quickly equip with the knowledge.',49.99),('0735710015','Steve Oualline','Vi iMproved (VIM)','New Riders Publishing','April-01','Complete guide to Vim editor, a clone of the standard Unix editor, Vi. ',45),('0735710430','Mark Mitchell, Jeffrey Oldham, Alex Samuel, Jeffery Oldham','Advanced Linux Programming','New Riders Publishing','June-01','Advanced Linux Programming is intended for the programmer already famililar with the C programming langauge. ',45),('0735710546','Paul DuBois','Mysql and Perl for the Web','New Riders Publishing','August-01','The book employs a practical learn-by-doing approach that demonstrates development techniques by building complete applications.',44.99),('0738203335','Glyn Moody','Rebel Code: Linux and the Open Source Revolution','Perseus Pr','January-01','Rebel Code puts Linux into historical and social contexts.',27.5),('076001096X','Jack Dent  Tony Gaddis','A Guide to UNIX Using Linux ','Course Technology, Inc.','December-99','Jack and Tony have written an excellent book that guides you step by step through each nook-N-cranny of the LINUX and UNIX OS.',56.95),('076153055X','Julie C. Meloni','PHP Fast & Easy Web Development','Prima Publishing','July-00','Comprehensive guide shows how to install Apache using Windows of Linux, mix PHP and HTML, use PHP variables, display dynamic content, and use cookies. ',24.99),('0761531513','Michael Hall, Brian Proffitt','The Joy of Linux','Prima Publishing','March-01','The Joy of Linux uncovers the \"whys\" of Linux. ',29.99),('0764502913','Ken A. L. Coar','Apache Server For Dummies','Hungry Minds, Inc','January-98','The examples are clear and the text is well written with good step-by-step action.',29.99),('0764506919','Jim Keogh','LINUX Programming for Dummies','Hungry Minds, Inc','January-00','This book is true to the Dummies style and walks you through the steps needed to creating your own Linux program.',24.99),('0764507443','Dee-Ann LeBlanc, Melanie Hoag, Evan Blomquist','Linux For Dummies, 3rd Edition','Hungry Minds, Inc','November-00','The book shows business managers and home users just what can be accomplished with Linux ',29.99),('0764507958','Jon Hall, Paul G. Sery','Red Hat Linux 7 for Dummies','Hungry Minds, Inc','December-00','A friendly, step-by-step guide to installing Red Hat Linux into a personal computer and taking advantage of all it has to offer.',29.99),('0764532189','Mohammed J. Kabir','Apache Server Bible','Hungry Minds, Inc','July-98','A book/CD-ROM guide to administering an Apache Web Server, for those with no previous Web administration experience. ',49.99),('0764533061','Mohammed J. Kabir','Apache Server Administrator\'s Handbook','Hungry Minds, Inc','March-99','When you need Apache server solutions right away, look no further than the Apache Server Administrator\'s Handbook.',29.99),('0764535374','Jay Greenspan, Brad Bulger','MySQL/PHP Database Applications','Hungry Minds, Inc','January-01','Topics covered: The PHP server-side scripting language and the MySQL database server',39.99),('0764546570','John Goerzen','Linux Programming Bible','Hungry Minds, Inc','April-00','Master basic tools, take charge of the Linux C tools, including compilers, libraries, and debuggers. ',39.99),('0764546627','Candace Leiden, Terry Collings','Linux Bible','Hungry Minds, Inc','May-01','Complete handbook and guide for learning to install, configure, and efficiently use a Linux network. ',49.99),('076454716X','Tim Converse, Joyce Park','PHP 4 Bible','Hungry Minds, Inc','August-00','PHP 4 Bible is as comprehensive a discussion as you will find about this fascinating language',34.99),('0764547712','Naba Barkakati','Red Hat Linux 7.1 Secrets','Hungry Minds, Inc','May-01','A guide to the secret short cuts, tune-ups, solutions, and workarounds that can be used to optimize usage of Red Hat Linux 7.1. ',49.99),('0764548204','Christopher Negus','Red Hat Linux 7.1 Bible : Unlimited Edition','Hungry Minds, Inc','June-01','Good book specially if you are totally new to Linux',49.99),('0782127347','Charles Aulds','Linux Apache Web Server Administration','Sybex','November-00','Good selection of examples which anyone can use in everyday Apache Web administration',39.99),('0782127355','Vicki Stanfield, Roderick Smith, Roderick W. Smith','Linux System Administration','Sybex','February-01','A text showing the average reader how to install and configure Linux correctly',39.95),('0782129277','Arman Danesh','Mastering Red Hat Linux 7','Sybex','August-01','This book provides comprehensive coverage of the latest version of Linux and GNOME, and also coverage of Apache server and sendmail. ',49.99),('0789724405','Wade Maxfield','MySQL and PHP From Scratch','Que','November-00','the majority of this book is about setting up IMP, MySql, and Php on a generic Linux box.',29.99),('156592469X','Matt Welsh, Matthias Kalle Dalheimer, Lar Kaufman, Matthew Welsh','Running Linux (3rd Edition)','O\'Reilly & Associates','August-99','For those with no previous knowledge of Linux but with a desire to really understand and be able to optimize your OS based on your needs, this book is for you.',39.95),('156592567X','Lincoln Stein, Doug MacEachern, Linda Mui (Editor)','Writing Apache Modules with Perl and C','O\'Reilly & Associates','March-99','It\'s very straight forward, focuses only on things that are related to writing modules in both Perl and C',39.95);
UNLOCK TABLES;

#
# Current Database: mysql
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ mysql;

USE mysql;

#
# Table structure for table 'columns_priv'
#

DROP TABLE IF EXISTS columns_priv;
CREATE TABLE columns_priv (
  Host char(60) binary NOT NULL default '',
  Db char(64) binary NOT NULL default '',
  User char(16) binary NOT NULL default '',
  Table_name char(64) binary NOT NULL default '',
  Column_name char(64) binary NOT NULL default '',
  Timestamp timestamp(14) NOT NULL,
  Column_priv set('Select','Insert','Update','References') NOT NULL default '',
  PRIMARY KEY  (Host,Db,User,Table_name,Column_name)
) TYPE=MyISAM COMMENT='Column privileges';

#
# Dumping data for table 'columns_priv'
#

LOCK TABLES columns_priv WRITE;
UNLOCK TABLES;

#
# Table structure for table 'db'
#

DROP TABLE IF EXISTS db;
CREATE TABLE db (
  Host char(60) binary NOT NULL default '',
  Db char(64) binary NOT NULL default '',
  User char(16) binary NOT NULL default '',
  Select_priv enum('N','Y') NOT NULL default 'N',
  Insert_priv enum('N','Y') NOT NULL default 'N',
  Update_priv enum('N','Y') NOT NULL default 'N',
  Delete_priv enum('N','Y') NOT NULL default 'N',
  Create_priv enum('N','Y') NOT NULL default 'N',
  Drop_priv enum('N','Y') NOT NULL default 'N',
  Grant_priv enum('N','Y') NOT NULL default 'N',
  References_priv enum('N','Y') NOT NULL default 'N',
  Index_priv enum('N','Y') NOT NULL default 'N',
  Alter_priv enum('N','Y') NOT NULL default 'N',
  PRIMARY KEY  (Host,Db,User),
  KEY User (User)
) TYPE=MyISAM COMMENT='Database privileges';

#
# Dumping data for table 'db'
#

LOCK TABLES db WRITE;
INSERT INTO db VALUES ('%','test','','Y','Y','Y','Y','Y','Y','N','Y','Y','Y'),('%','test\\_%','','Y','Y','Y','Y','Y','Y','N','Y','Y','Y'),('localhost','people','apache','Y','Y','Y','Y','N','N','N','N','N','N'),('localhost','books','apache','Y','Y','Y','Y','N','N','N','N','N','N'),('localhost','product_database','apache','Y','Y','Y','Y','N','N','N','N','N','N');
UNLOCK TABLES;

#
# Table structure for table 'func'
#

DROP TABLE IF EXISTS func;
CREATE TABLE func (
  name char(64) binary NOT NULL default '',
  ret tinyint(1) NOT NULL default '0',
  dl char(128) NOT NULL default '',
  type enum('function','aggregate') NOT NULL default 'function',
  PRIMARY KEY  (name)
) TYPE=MyISAM COMMENT='User defined functions';

#
# Dumping data for table 'func'
#

LOCK TABLES func WRITE;
UNLOCK TABLES;

#
# Table structure for table 'host'
#

DROP TABLE IF EXISTS host;
CREATE TABLE host (
  Host char(60) binary NOT NULL default '',
  Db char(64) binary NOT NULL default '',
  Select_priv enum('N','Y') NOT NULL default 'N',
  Insert_priv enum('N','Y') NOT NULL default 'N',
  Update_priv enum('N','Y') NOT NULL default 'N',
  Delete_priv enum('N','Y') NOT NULL default 'N',
  Create_priv enum('N','Y') NOT NULL default 'N',
  Drop_priv enum('N','Y') NOT NULL default 'N',
  Grant_priv enum('N','Y') NOT NULL default 'N',
  References_priv enum('N','Y') NOT NULL default 'N',
  Index_priv enum('N','Y') NOT NULL default 'N',
  Alter_priv enum('N','Y') NOT NULL default 'N',
  PRIMARY KEY  (Host,Db)
) TYPE=MyISAM COMMENT='Host privileges;  Merged with database privileges';

#
# Dumping data for table 'host'
#

LOCK TABLES host WRITE;
UNLOCK TABLES;

#
# Table structure for table 'tables_priv'
#

DROP TABLE IF EXISTS tables_priv;
CREATE TABLE tables_priv (
  Host char(60) binary NOT NULL default '',
  Db char(64) binary NOT NULL default '',
  User char(16) binary NOT NULL default '',
  Table_name char(60) binary NOT NULL default '',
  Grantor char(77) NOT NULL default '',
  Timestamp timestamp(14) NOT NULL,
  Table_priv set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter') NOT NULL default '',
  Column_priv set('Select','Insert','Update','References') NOT NULL default '',
  PRIMARY KEY  (Host,Db,User,Table_name),
  KEY Grantor (Grantor)
) TYPE=MyISAM COMMENT='Table privileges';

#
# Dumping data for table 'tables_priv'
#

LOCK TABLES tables_priv WRITE;
UNLOCK TABLES;

#
# Table structure for table 'user'
#

DROP TABLE IF EXISTS user;
CREATE TABLE user (
  Host char(60) binary NOT NULL default '',
  User char(16) binary NOT NULL default '',
  Password char(16) binary NOT NULL default '',
  Select_priv enum('N','Y') NOT NULL default 'N',
  Insert_priv enum('N','Y') NOT NULL default 'N',
  Update_priv enum('N','Y') NOT NULL default 'N',
  Delete_priv enum('N','Y') NOT NULL default 'N',
  Create_priv enum('N','Y') NOT NULL default 'N',
  Drop_priv enum('N','Y') NOT NULL default 'N',
  Reload_priv enum('N','Y') NOT NULL default 'N',
  Shutdown_priv enum('N','Y') NOT NULL default 'N',
  Process_priv enum('N','Y') NOT NULL default 'N',
  File_priv enum('N','Y') NOT NULL default 'N',
  Grant_priv enum('N','Y') NOT NULL default 'N',
  References_priv enum('N','Y') NOT NULL default 'N',
  Index_priv enum('N','Y') NOT NULL default 'N',
  Alter_priv enum('N','Y') NOT NULL default 'N',
  PRIMARY KEY  (Host,User)
) TYPE=MyISAM COMMENT='Users and global privileges';

#
# Dumping data for table 'user'
#

LOCK TABLES user WRITE;
INSERT INTO user VALUES ('localhost','root','385f75b73bb7b609','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('elcap.onsight.com','root','','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','','','N','N','N','N','N','N','N','N','N','N','N','N','N','N'),('elcap.onsight.com','','','N','N','N','N','N','N','N','N','N','N','N','N','N','N'),('localhost','apache','6f28ea2934393147','N','N','N','N','N','N','N','N','N','N','N','N','N','N');
UNLOCK TABLES;

#
# Current Database: people
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ people;

USE people;

#
# Table structure for table 'age_information'
#

DROP TABLE IF EXISTS age_information;
CREATE TABLE age_information (
  lastname char(20) default NULL,
  firstname char(20) default NULL,
  age int(11) default NULL
) TYPE=MyISAM;

#
# Dumping data for table 'age_information'
#

LOCK TABLES age_information WRITE;
INSERT INTO age_information VALUES ('Wall','Larry',46),('Torvalds','Linus',31),('Raymond','Eric',40),('Ballard','Ron',30),('Kedzierski','John',23);
UNLOCK TABLES;

#
# Current Database: product_database
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ product_database;

USE product_database;

#
# Table structure for table 'manufacturers'
#

DROP TABLE IF EXISTS manufacturers;
CREATE TABLE manufacturers (
  man_id char(10) NOT NULL default '',
  name char(60) default NULL,
  address char(60) default NULL,
  city char(60) default NULL,
  state char(2) default NULL,
  zip char(10) default NULL,
  PRIMARY KEY  (man_id)
) TYPE=MyISAM;

#
# Dumping data for table 'manufacturers'
#

LOCK TABLES manufacturers WRITE;
INSERT INTO manufacturers VALUES ('1001','Wally\'s Widgets','123 Main St.','Chicago','IL','60011'),('1002','Sam\'s House of Wonder','987 Oak St.','Los Angeles','CA','90093'),('1003','Henrietta\'s Hut','388 W. 75th St.','New York','NY','10043');
UNLOCK TABLES;

#
# Table structure for table 'products'
#

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  prod_id varchar(10) NOT NULL default '',
  man_id varchar(10) default NULL,
  name varchar(60) default NULL,
  category varchar(30) default NULL,
  description blob,
  price double default NULL,
  PRIMARY KEY  (prod_id)
) TYPE=MyISAM;

#
# Dumping data for table 'products'
#

LOCK TABLES products WRITE;
INSERT INTO products VALUES ('C101','1001','Item 1','Item','Wally\'s first item',10.43),('C102','1001','Item 2','Item','Wally\'s second item',9.99),('C789','1002','Item 3','Item','A Fine Sam item',9.99),('C790','1002','Item 4','Item','Another Fine Sam item',14.99),('T983','1003','Widget 1','Widget','Henrietta\'s first widget',1.98),('T984','1003','Widget 2','Widget','Henrietta\'s second widget',11.01);
UNLOCK TABLES;

#
# Current Database: test
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ test;

USE test;

