<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="">
</head>

<body>
    <h1>Hallo tests</h1>
    <?php


    function Form()
    {
    ?>
        <form class="formular" action="index.php" method="post">
            <input type="text" name="Name" placeholder="Name">
            <input type="submit" name="submit">

            <input name="Sprache" list="Sprache" required placeholder="Sprache" />
            <datalist id="Sprache">
                <option value='Deutsch'>
                <option value="Englisch"> 
            </datalist>
        <?php
    }
        ?>
        </form>
        <?php

        if (isset($_COOKIE["Name"])) {
            echo "<p>Cookie da</p>";
            switch ($_COOKIE["Sprache"]) {
                case "Deutsch":
                    echo "Guten Tag ";
                    break;
                case "Englisch":
                    echo "Good Day ";
                    break;
            }
            echo $_COOKIE["Name"];
        } else {
            echo "<p>Kein Cookie da</p>";
            if (isset($_POST["submit"])) {
                echo "<p>Cookies werden Gesetzt</p>";

                setcookie("Name", $_POST["Name"]);
                setcookie("Sprache",  $_POST["Sprache"]);

                header("Refresh:0");
            } else {
                echo "<p>Cookies werden Angefordert</p>";
                Form();
            }
        }
        ?>
</body>

</html>