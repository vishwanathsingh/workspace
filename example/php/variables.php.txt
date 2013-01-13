<?
    // assign some variables the different data types
    $integer = 12;
    $float1  = 1.345e23;
    $float2  = 4995.392;
    $string1 = 'My favorite number is $integer';
    $string2 = "I am this big: $float1 or $float2";
?>
<html>
<head>
<title>Integers, Floats and Strings in PHP</title>
</head>
<body bgcolor="#ffffff">
Integer: <b><? echo $integer; ?></b><br>
Float 1: <b><? echo $float1; ?></b>
<i>note that the format is *almost* the same as assigned</i><br>
Float 2: <b><? echo $float2; ?></b>
<i>the format is the same as assigned</i><br>
String 1: <b><? echo $string1; ?></b><br>
String 2: <b><? echo $string2; ?></b>
</body>
</html>
