# MySQL dump 8.14
#
# Host: localhost    Database: product_database
#--------------------------------------------------------
# Server version	3.23.41

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

