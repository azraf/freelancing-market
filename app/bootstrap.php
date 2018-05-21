<?php
include_once __DIR__ . '/Config/Environment.php';
include_once __DIR__ . '/Config/Database.php';

if(APP_LEVEL == 'debug'){
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
} else if(APP_LEVEL == 'test'){
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 0);
    error_reporting(E_ALL ^ E_NOTICE);
} else {
    ini_set('display_errors', 0);
    ini_set('display_startup_errors', 0);
    error_reporting(0);
}

require ROOTPATH . 'vendor/autoload.php';
bootBase();
session_start();

use Models\Database;
new Database();

$GLOBALS['config'] = array(
    'mysql' => array(
        'host' => DBHOST,
        'username' => DBUSER,
        'password' => DBPASS,
        'db' => DBNAME
    ),
    'remember' => array(
        'cookie_name' => 'hash',
        'cookie_expiry' => 604800
    ),
    'language' => array(
        'cookie_name' => 'lang',
        'session_name' => 'lang',
        'cookie_expiry' => 604800
    ),
    'session' => array(
        'session_admin' => 'admin',
        'session_name' => 'user',
        'token_name' => 'token'
    )
);
require_once ROOTAPPPATH . 'Helper/fn_lang_front.php';

?>
