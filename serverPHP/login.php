<?php
session_cache_limiter('nocache');
@session_start();
# $_SESSION['auser']="root"; Erzeuge statt dessen eine Benutzer-Array 
#
#$_SESSION['apass']="geheim";
$users2 = array(# Diese Daten müssen über LDAP-Protokoll mit Hilfe des     
    # des Servers übergeben bzw. überprüft              
    "fritz" =>   "geheim0",
    "hans"  =>   "geheim1",
    "otto"  =>   "geheim2"
);
$_SESSION['a_users'] = $users2;
include("./test_array_login.php"); ?>
<!DOCTYPE HTML>
<html>

<head>
    <title></title>
    <meta name="generator" content="Bluefish 1.0.7">
    <meta name="author" content="root">
    <meta name="date" content="2008-11-28T13:37:38+0100">
    <meta name="copyright" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="ROBOTS" content="NOINDEX, NOFOLLOW">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="content-type" content="application/xhtml+xml; charset=UTF-8">
    <meta http-equiv="content-style-type" content="text/css">
</head>

<body> <?PHP echo "<br> Dies ist der geschützte Inhalt, der erst nach dem Login erscheint!<br>"; ?> <form action="<?php echo $SCRIPT_NAME ?>" method="post" enctype="application/x-www-form-urlencoded" target="_self">
        <input type="submit" name="abmelden" value="abmelden">
    </form>
</body>

</html>