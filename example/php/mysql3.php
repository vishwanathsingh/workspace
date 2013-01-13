<?
    // connect to the mysql server on localhost
    $mysql = mysql_connect("localhost", "apache", "LampIsCool")
        or die("could not connect to mysql");

    // select the "books" database
    mysql_select_db("books")
        or die("select failed - " . mysql_errno() . ": " . mysql_error());

    // execute the MySQL query, grab the result in $result
    $result = mysql_query("SELECT isbn,title,price FROM book_information")
        or die("query failed - " . mysql_errno() . ": " . mysql_error());

?>
<html>
<head>
<title>PHP and MySQL - Example 3</title>
</head>
<body bgcolor="#ffffff">

<table border="1">
  <tr>
    <th>ISBN</th>
    <th>Title</th>
    <th>Price</th>
  </tr>

<? 
  // a different way to build the HTML, using print()
  // function calls within a while loop (echo could have
  // been used

  // $array is indexed as an associative array

  while ($array = mysql_fetch_array($result)) {
    print "  <tr>";
    print "    <td>" . $array["isbn"] . "</td>";
    print "    <td>" . $array["title"] . "</td>";
    print "    <td>" . $array["price"] . "</td>";
    print "  </tr>";
  }

  // free memory
  mysql_free_result($result);

  // we are all done, so close the MySQL connection
  mysql_close($mysql);
?>

</table>

</body>
</html>
