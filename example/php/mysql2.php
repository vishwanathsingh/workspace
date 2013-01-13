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
<title>PHP and MySQL - Example 2</title>
</head>
<body bgcolor="#ffffff">
<table border="1">

  <tr>
    <th>ISBN</th>
    <th>Author(s)</th>
    <th>Title</th>
  </tr>

<? while ($array = mysql_fetch_row($result)) : ?>
  <tr>
    <td><? echo $array[0]; ?></td>
    <td><? echo $array[1]; ?></td>
    <td><? echo $array[2]; ?></td>
  </tr>
<? endwhile; ?>

</table>
</body>
</html>
<?
    // we are all done, so close the MySQL connection
    mysql_close($mysql);
?>
