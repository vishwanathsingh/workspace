<?
    $name = $HTTP_GET_VARS["name"];
    $age  = $HTTP_GET_VARS["age"];

    // this sytax is recommend when the entire if
    // is contained with a PHP block like this one

    $msg = "You $name are ";
    if ($age < 13) {
        $msg = $msg . "a child";
    } elseif ($age < 18) {
        $msg = $msg . "a teenager";
    } elseif ($age < 62) {
        $msg = $msg . "an adult";
    } else {
        $msg = $msg . "a senior";
    }

    // the syntax of the if statement below is
    // recommended if you have embedded PHP code
?> 
<html>
<head>
<title>PHP if statement</title>
</head>
<body bgcolor="#ffffff">
<? echo $msg; ?>
<hr>
<? if ($name < "N") : ?>
Your name begins with A through M
<? else: ?>
Your name begins with N through Z
<? endif; ?>
</body>
</html>
