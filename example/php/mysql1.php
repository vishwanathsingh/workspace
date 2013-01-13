<?
    // connect to the mysql server on localhost
    $mysql = mysql_connect("localhost", "apache", "LampIsCool")
        or die("could not connect to mysql");

    // execute the MySQL query, grab the result in $result
    $result = mysql_db_query("books", "SELECT * FROM book_information")
        or die("query failed - " . mysql_errno() . ": " . mysql_error());

?>
<html>
<head>
<title>PHP and MySQL - Example 1</title>
</head>
<body bgcolor="#ffffff">
We executed: <b>SELECT * FROM book_information</b>
<hr>
We found <b><? echo mysql_num_rows($result); ?></b> rows.

<h3>Query result</h3>

<? 
    //loop through each row 
    while ($array = mysql_fetch_row($result)) {
        // foreach column in the row 
        foreach ($array as $f) {
            print "$f :: "; 
        }
        print "<hr>";
    }
?>
</body>
</html>
<?
    // we are all done, so close the MySQL connection
    mysql_close($mysql);
?>
