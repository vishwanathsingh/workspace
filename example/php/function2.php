<?
    function return_string() {
       // return a string
        return "hello, world!";
    }

    function return_array1() {
       // return an array of integers
        return array(2, 4, 6, 8);
    }

    function return_array2() {
        // return a more complicated array
        $a = array(
            "one"   => "first",
            "two"   => "second",
            "three" => "third"
        );
        return $a;
    }
?>
<html>
<head>
<title>PHP Functions - Return Values</title>
</head>
<body bgcolor="#ffffff">

<? 
    // echo the return value from return_string()
    echo return_string(); 
?>

<hr>

<?
    // grab the array returned from return_array1()
    // foreach through it, echoing the value
    $array1 = return_array1();
    foreach ($array1 as $value) {
        echo "$value <br>";
    }
?>

<hr>

<?
    // grab the array returned from return_array2()
    // foreach through it, echoing the keys and values
    $array2 = return_array2();
    foreach ($array2 as $k => $v) {
        echo "$k : $v <br>";
    }
?>

</body>
</html>
