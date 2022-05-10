<?php
session_cache_limiter('nocache');
@session_start();

function auth_login(){

    //echo "an Position2 "; 
    $_SESSION['abc123'] = "leer";
    $realm = "Hallo-Server";
    session_write_close(); 
     //Diese Funktion bewirkt eine abschließende serverseitige12.   
    // übernahme der PHP-SESSION-Werte!!!  
    header('WWW-Authenticate: Basic realm="Realm ID=' . $realm . ']"');
    header('HTTP/1.0 401 Unauthorized');
    die("Sie haben die Benutzeranmeldung abgebrochen!<br><br><a href='" . $_SERVER['HTTP_REFERER'] . "'>zurück zum Login</a>");
}

function abmelden()
{
    unset($_SESSION['abc123']);    #die Session löschen 
    unset($_SERVER['PHP_AUTH_USER']);
    unset($_SERVER['PHP_AUTH_PW']);
    unset($_REQUEST['abmelden']);
    session_destroy();
}

function auth()
{
    if ((!isset($_SESSION['abc123'])) || ($_SESSION['abc123'] != "true")) {
        $d123 = "false";
        // hier sollte eine Änderung des Codes in der Form:       
        //    $adbindung = adldap2(config); // erfolgen!
        foreach ($_SESSION['a_users'] as $benutzer => $password) {
            if (($_SERVER['PHP_AUTH_USER'] == $benutzer) && ($_SERVER['PHP_AUTH_PW'] == $password)) {
                $_SESSION['auser'] = $benutzer;
                $_SESSION['apass'] = $password;
                $_SESSION['abc123'] = "true";
                $d123 = "true";
            }
        }
        if ($d123 == "false") {
            unset($_SESSION['abc123']);
            //echo "falsches Passwort";            
            //echo "<br><a href='".$_SERVER['HTTP_REFERER']."'>zurück</a>";    
            //oder die andere Alternative                   
            auth_login();
            $pfad = "Location: " . $_SERVER['HTTP_REFERER'];
            header($pfad);
            exit;
        }
    }
}

### Ende der Funktionendeklaration 
###### auszuführender Code: 
if (isset($_REQUEST['abmelden'])) {
    abmelden();
    $pfad = $_SERVER['HTTP_REFERER'];
    echo "<br>Die Abmeldung war erfolgreich!<br>";
    echo "<br>         <a href='" . $pfad . "' >zurück</a>";
    $CookieInfo = session_get_cookie_params();
    exit;
} else {
    if ((!isset($_SESSION['abc123']))) {
        //echo "da bin ich 0 "; 
        auth_login();
        //Login durch die Browser-Header-Funktion! 
    }
    auth();
}
?> 