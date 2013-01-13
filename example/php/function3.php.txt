<?
    function no_default_args($a, $b, $c) {
        echo "<hr>";
        echo "no_default_args(): \$a : $a <br>";
        echo "no_default_args(): \$b : $b <br>";
        echo "no_default_args(): \$c : $c <br>";
    }

    // this function is defined so that the arguments
    // have default values
    function default_args($a = 2, $b = 4, $c = 6) {
        echo "<hr>";
        echo "default_args(): \$a : $a <br>";
        echo "default_args(): \$b : $b <br>";
        echo "default_args(): \$c : $c <br>";
    }

    // this function accepts an array
    function expects_array($a) {
        echo "<hr>";
        foreach ($a as $k => $v) {
            echo "expects_array(): $k : $v <br>";
        }
    }
?>
<html>
<head>
<title>PHP Functions - Arguments</title>
</head>
<body bgcolor="#ffffff">

<?
    // no_default_args() expects 3 arguments
    no_default_args("foo", "bar", 20);
    no_default_args(10, 48*23, 1.884e-23);
    // this one only passes in 2 args, but the function
    // expects 3 - a warning message is generated and
    // the last arg gets empty string
    no_default_args(1,2);


    // use the defaults
    default_args();
    // override the first two defaults, use the third default
    default_args("foo","bar");


    // create an array to pass into expects_array()
    $array = array(
        "one"   => "first", 
        "two"   => "second", 
        "three" => "third"
    );

    // pass in an array because that is what it expects
    expects_array($array);

    // pass in a string, yet it expects an array - warning message!
    expects_array("foo");
?>
</body>
</html>
