<?
    // enumerated array of numbers
    $nums = array(2, 4, 6, 8);

    // associative array of names and ages
    $ages = array(
        "Ron"  => 31,
        "Gail" => 26,
        "Al"   => 38,
        "Tom"  => 36
    );
?>
<html>
<head>
<title>Examples of PHP Loops</title>
</head>
<body bgcolor="#ffffff">

<h3>Loop through $nums with the while loop</h3>
<? 
    $i = 0;
    while ($i < 4) {
        echo "$nums[$i] ";
        $i++;
    }
?>

<h3>Loop through $nums with the for loop</h3>
<? 
    for ($i = 0; $i < 4; $i++) {
        echo "$nums[$i] ";
    }
?>

<h3>Loop through $nums with the foreach loop</h3>
<? 
    foreach ($nums as $v) {
        echo "$v ";
    }
?>

<h3>Display ages in a table using the foreach loop</h3>
<table border="1">
<?
    foreach ($ages as $k => $v) {
        echo "<tr><th>$k</th><td>$v</td></tr>";
    }
?>
</table>

</body>
</html>
